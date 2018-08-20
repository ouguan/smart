package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.api.Builders;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.openstack4j.openstack.identity.v3.domain.KeystoneRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.exception.ServiceException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.dao.RoleDao;
import com.smart.sso.server.model.Role;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.RolePermissionService;
import com.smart.sso.server.service.RoleService;

@Service("roleService")
public class RoleServiceImpl extends ServiceImpl<RoleDao, Role, String> implements RoleService {

	@Resource
	private ProjectUserRoleService projectUserRoleService;
	@Resource
	private RolePermissionService rolePermissionService;

	@Override
    @Autowired
	public void setDao(RoleDao dao) {
		this.dao = dao;
	}

    @Override
    public Role get(String id) {
        return this.dao.get(id);
    }

    @Override
    public void enable(Boolean isEnable, List<String> idList) {
        int count = 0;
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for(String roleId : idList) {
                Role role = get(roleId);
                if(role != null) {
                    role.setIsEnable(isEnable);
                    role.updateExtra();
                    dao.enable(role.getExtra(), role.getId());
                    count ++;
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "角色数据库更新失败");
        }
	}

	@Override
    public void save(Role role) {
	    Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        
        if(role.getId() == null) {
            KeystoneRole newRole = (KeystoneRole) OSFactory.clientFromToken(token).identity().roles().create(Builders.role()
                                                               .name(role.getName())
                                                               .build());
            role.setId(newRole.getId());
        }
        this.dao.updateRole(role.getName(), role.getExtra(), role.getId());
	}

	@Override
    public Pagination<Role> findPaginationByName(String name, Pagination<Role> p) {
		dao.findPaginationByName(name, p);
		return p;
	}

	@Override
    public List<Role> findByAll(Boolean isEnable) {
	    List<Role> ret = new ArrayList<Role>();
	    Pagination<Role> prole = new Pagination<Role>();
	    dao.findPaginationByName(null, prole);
	    
	    for(Role role : prole.getList()) {
	        if(role.getIsEnable() == isEnable) {
	            ret.add(role);
	        }
	    }
		return ret;
	}

	@Override
    @Transactional
	public void deleteById(List<String> idList) {
	    projectUserRoleService.deleteByRoleIds(idList);
		rolePermissionService.deleteByRoleIds(idList);
		
		int count = 0;
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for(String roleId : idList) {
                Role role = get(roleId);
                if(role != null) {
                    OSFactory.clientFromToken(token).identity().roles().delete(role.getId());
                    count ++;
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "角色数据库删除失败");
        }
	}
}
