package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.rpc.RpcPermission;
import com.smart.sso.server.dao.PermissionDao;
import com.smart.sso.server.model.Permission;
import com.smart.sso.server.model.RolePermission;
import com.smart.sso.server.service.PermissionJmsService;
import com.smart.sso.server.service.PermissionService;
import com.smart.sso.server.service.ProjectService;
import com.smart.sso.server.service.RolePermissionService;

@Service("permissionService")
public class PermissionServiceImpl extends ServiceImpl<PermissionDao, Permission, String> implements PermissionService {

	@Resource
	private RolePermissionService rolePermissionService;
	@Resource
	private PermissionService permissionService;
	@Resource
	private ProjectService projectService;
	@Resource
	private PermissionJmsService permissionJmsService;

	@Override
    @Autowired
	public void setDao(PermissionDao dao) {
		this.dao = dao;
	}

	@Override
    public void save(Permission t) {
		super.save(t);
		// JMS通知权限变更
		permissionJmsService.send(projectService.get(t.getAppId()).getCode());
	}

	@Override
    public List<Permission> findByAppId(String appId, String roleId, Boolean isEnable) {
		List<Permission> permissionList = dao.findByAppId(appId, isEnable);
		if (roleId != null) {
			List<RolePermission> rolePermissionList = rolePermissionService.findByRoleId(roleId);
			for (Permission permission : permissionList) {
				for (RolePermission rp : rolePermissionList) {
					if (permission.getId().equals(rp.getPermissionId())) {
						permission.setChecked(true);
						break;
					}
				}
			}
		}
		return permissionList;
	}

	@Override
    @Transactional
	public void deletePermission(String id, String appId) {
		List<String> idList = new ArrayList<String>();

		List<Permission> list = permissionService.findByAppId(appId, null, null);
		loopSubList(id, idList, list);
		idList.add(id);

		rolePermissionService.deleteByPermissionIds(idList);

		verifyRows(dao.deleteById(idList), idList.size(), "权限数据库删除失败");
		
		// JMS通知权限变更
		permissionJmsService.send(projectService.get(appId).getCode());
	}

	// 递归方法，删除子权限
	protected void loopSubList(String id, List<String> idList, List<Permission> list) {
		for (Permission p : list) {
			if (id.equals(p.getParentId())) {
				idList.add(p.getId());
				loopSubList(p.getId(), idList, list);
			}
		}
	}

	@Override
    public void deleteByAppIds(List<String> idList) {
		dao.deleteByAppIds(idList);
	}

	@Override
    public List<RpcPermission> findListById(String appCode, String userId) {
		return dao.findListById(appCode, userId);
	}
}
