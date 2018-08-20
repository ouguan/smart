package com.smart.sso.server.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.exception.ServiceException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.dao.ProjectUserRoleDao;
import com.smart.sso.server.model.ProjectUserRole;
import com.smart.sso.server.service.ProjectService;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.UserService;

@Service("projectUserRoleService")
public class ProjectUserRoleImpl extends ServiceImpl<ProjectUserRoleDao, ProjectUserRole, String> implements ProjectUserRoleService {

    @Resource
    private UserService    userService;
    @Resource
    private ProjectService projectService;

    @Override
    @Autowired
    public void setDao(ProjectUserRoleDao dao) {

        this.dao = dao;
    }

    @Override
    public Pagination<ProjectUserRole> findByProjectUserRoleId(String projectId, String userId, String roleId, Pagination<ProjectUserRole> p) {

        dao.findByProjectUserRoleId(projectId, userId, roleId, p);
        return p;
    }

    @Override
    public void deleteByProjectIds(List<String> idList) {

        dao.deleteByProjectIds(idList);
    }

    @Override
    public void deleteByRoleIds(List<String> idList) {

        dao.deleteByRoleIds(idList);
    }

    @Override
    public void deleteByUserIds(List<String> idList) {

        dao.deleteByUserIds(idList);
    }

    @Override
    @Transactional
    public void allocate(List<ProjectUserRole> list) {

        // 更新用户信息
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        
        // 更新assignment
        for (ProjectUserRole val : list) {
            // dao.deleteByAssignmentIds(val.getActor_id(),val.getTarget_id(),val.getRole_id());
            if (projectService.get(val.getTarget_id()).getIs_domain()) {
                if(userService.get(val.getActor_id()) != null) {
                    if (OSFactory.clientFromToken(token).identity().roles().checkDomainUserRole(val.getTarget_id(), val.getActor_id(), val.getRole_id()).isSuccess()) {
                        OSFactory.clientFromToken(token).identity().roles().grantDomainUserRole(val.getTarget_id(), val.getActor_id(), val.getRole_id());
                    }
                } else {
                    if (OSFactory.clientFromToken(token).identity().roles().checkDomainGroupRole(val.getTarget_id(), val.getActor_id(), val.getRole_id()).isSuccess()) {
                        OSFactory.clientFromToken(token).identity().roles().grantDomainGroupRole(val.getTarget_id(), val.getActor_id(), val.getRole_id());
                    }
                }
            } else {
                if(userService.get(val.getActor_id()) != null) {
                    if (OSFactory.clientFromToken(token).identity().roles().checkProjectUserRole(val.getTarget_id(), val.getActor_id(), val.getRole_id()).isSuccess()) {
                        OSFactory.clientFromToken(token).identity().roles().grantProjectUserRole(val.getTarget_id(), val.getActor_id(), val.getRole_id());
                    }
                } else {
                    if (OSFactory.clientFromToken(token).identity().roles().checkProjectGroupRole(val.getTarget_id(), val.getActor_id(), val.getRole_id()).isSuccess()) {
                        OSFactory.clientFromToken(token).identity().roles().grantProjectGroupRole(val.getTarget_id(), val.getActor_id(), val.getRole_id());
                    }
                }
            }
        }
        //super.save(list);
    }
}