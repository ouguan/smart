package com.smart.sso.server.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.RoleDao;
import com.smart.sso.server.model.Role;
import com.smart.sso.server.service.RolePermissionService;
import com.smart.sso.server.service.RoleService;
import com.smart.sso.server.service.UserRoleService;

@Service("roleService")
public class RoleServiceImpl extends ServiceImpl<RoleDao, Role, String> implements RoleService {

	@Resource
	private UserRoleService userRoleService;
	@Resource
	private RolePermissionService rolePermissionService;

	@Override
    @Autowired
	public void setDao(RoleDao dao) {
		this.dao = dao;
	}

	@Override
    public void enable(Boolean isEnable, List<String> idList) {
		verifyRows(dao.enable(isEnable, idList), idList.size(), "角色数据库更新失败");
	}

	@Override
    public void save(Role t) {
		super.save(t);
	}

	@Override
    public Pagination<Role> findPaginationByName(String name, Pagination<Role> p) {
		dao.findPaginationByName(name, null, p);
		return p;
	}

	@Override
    public List<Role> findByAll(Boolean isEnable) {
		return dao.findPaginationByName(null, isEnable, null);
	}

	@Override
    @Transactional
	public void deleteById(List<String> idList) {
		userRoleService.deleteByRoleIds(idList);
		rolePermissionService.deleteByRoleIds(idList);
		verifyRows(dao.deleteById(idList), idList.size(), "角色数据库删除失败");
	}
}
