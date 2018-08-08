package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.RolePermissionDao;
import com.smart.sso.server.model.RolePermission;
import com.smart.sso.server.service.AppService;
import com.smart.sso.server.service.PermissionJmsService;
import com.smart.sso.server.service.RolePermissionService;
import com.smart.sso.server.service.RoleService;

@Service("rolePermissionService")
public class RolePermissionServiceImpl extends ServiceImpl<RolePermissionDao, RolePermission, String> implements RolePermissionService {
	
	@Resource
	private RoleService roleService;
	@Resource
	private AppService appService;
	@Resource
	private PermissionJmsService permissionJmsService;

	@Override
    @Autowired
	public void setDao(RolePermissionDao dao) {
		this.dao = dao;
	}

	@Override
    @Transactional
	public void allocate(String appId, String roleId, List<String> permissionIdList) {
		dao.deleteByAppAndRoleId(appId, roleId);

		List<RolePermission> list = new ArrayList<RolePermission>();
		String permissionId;
		for (Iterator<String> i$ = permissionIdList.iterator(); i$.hasNext(); list
				.add(new RolePermission(appId, roleId, permissionId))) {
			permissionId = i$.next();
		}
		if (!CollectionUtils.isEmpty(list)) {
			super.save(list);
		}

		// JMS通知权限变更
		permissionJmsService.send(appService.get(appId).getCode());
	}

	@Override
    public List<RolePermission> findByRoleId(String roleId) {
		return dao.findByRoleId(roleId);
	}

	@Override
    public void deleteByPermissionIds(List<String> idList) {
		dao.deleteByPermissionIds(idList);
	}
	
	@Override
    public void deleteByRoleIds(List<String> idList) {
		dao.deleteByRoleIds(idList);
	}
	
	@Override
    public void deleteByAppIds(List<String> idList) {
		dao.deleteByAppIds(idList);
	}
}
