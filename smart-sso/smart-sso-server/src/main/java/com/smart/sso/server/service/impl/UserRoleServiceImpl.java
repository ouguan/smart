package com.smart.sso.server.service.impl;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.UserRoleDao;
import com.smart.sso.server.model.UserRole;
import com.smart.sso.server.service.UserRoleService;

@Service("userRoleService")
public class UserRoleServiceImpl extends ServiceImpl<UserRoleDao, UserRole, String> implements UserRoleService {

	@Override
    @Autowired
	public void setDao(UserRoleDao dao) {
		this.dao = dao;
	}
	
	@Override
    @Transactional
	public void allocate(String userId, List<UserRole> list) {
		dao.deleteByUserIds(Arrays.asList(userId));
		super.save(list);
	}
	
	@Override
    public UserRole findByUserRoleId(String userId, String roleId) {
		return dao.findByUserRoleId(userId, roleId);
	}
	
	@Override
    public void deleteByRoleIds(List<String> idList) {
		dao.deleteByRoleIds(idList);
	}
	
	@Override
    public void deleteByUserIds(List<String> idList) {
		dao.deleteByUserIds(idList);
	}
}
