package com.smart.sso.server.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.AppDao;
import com.smart.sso.server.model.App;
import com.smart.sso.server.service.AppService;
import com.smart.sso.server.service.PermissionService;
import com.smart.sso.server.service.RolePermissionService;
import com.smart.sso.server.service.RoleService;
import com.smart.sso.server.service.UserRoleService;
import com.smart.sso.server.service.UserService;

@Service("appService")
public class AppServiceImpl extends ServiceImpl<AppDao, App, String> implements AppService {
	
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private PermissionService permissionService;
	@Resource
	private UserRoleService userRoleService;
	@Resource
	private RolePermissionService rolePermissionService;

	@Override
    @Autowired
	public void setDao(AppDao dao) {
		this.dao = dao;
	}
	
	@Override
    public void enable(Boolean isEnable, List<String> idList) {
		verifyRows(dao.enable(isEnable, idList), idList.size(), "应用数据库更新失败");
	}
	
	@Override
    public void save(App t) {
		super.save(t);
	}

	@Override
    public List<App> findByAll(Boolean isEnable) {
		return dao.findPaginationByName(null, isEnable, null);
	}

	@Override
    public Pagination<App> findPaginationByName(String name, Pagination<App> p) {
		dao.findPaginationByName(name, null, p);
		return p;
	}

	@Override
    public App findByCode(String code) {
		return dao.findByCode(code);
	}
	
	@Override
    @Transactional
	public void deleteById(List<String> idList) {
		rolePermissionService.deleteByAppIds(idList);
		permissionService.deleteByAppIds(idList);
		verifyRows(dao.deleteById(idList), idList.size(), "应用数据库删除失败");
	}
}
