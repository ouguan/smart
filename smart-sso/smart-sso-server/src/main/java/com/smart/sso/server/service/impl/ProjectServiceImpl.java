package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.api.Builders;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.openstack4j.openstack.identity.v3.domain.KeystoneDomain;
import org.openstack4j.openstack.identity.v3.domain.KeystoneProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.exception.ServiceException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.dao.ProjectDao;
import com.smart.sso.server.model.Project;
import com.smart.sso.server.model.ProjectUserRole;
import com.smart.sso.server.service.PermissionService;
import com.smart.sso.server.service.ProjectService;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.RolePermissionService;
import com.smart.sso.server.service.RoleService;
import com.smart.sso.server.service.UserService;

@Service("projectService")
public class ProjectServiceImpl extends ServiceImpl<ProjectDao, Project, String> implements ProjectService {

    @Resource
    private UserService            userService;
    @Resource
    private RoleService            roleService;
    @Resource
    private PermissionService      permissionService;
    @Resource
    private ProjectUserRoleService projectUserRoleService;
    @Resource
    private RolePermissionService  rolePermissionService;

    @Override
    @Autowired
    public void setDao(ProjectDao dao) {

        this.dao = dao;
    }

    @Override
    public Project get(String id) {

        return this.dao.get(id);
    }

    @Override
    public void save(Project project) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        if (project.getId() == null) {
            if (project.getIs_domain()) {
                KeystoneDomain newDomain = (KeystoneDomain) OSFactory.clientFromToken(token).identity().domains().create(Builders.domain().name(project.getName()).description(project.getDescription()).enabled(project.getEnabled()).build());
                project.setId(newDomain.getId());
            } else {
                KeystoneProject newProject = (KeystoneProject) OSFactory.clientFromToken(token).identity().projects().create(Builders.project().name(project.getName()).description(project.getDescription()).enabled(project.getEnabled()).build());
                project.setId(newProject.getId());
            }
        }
        this.dao.updateProject(project.getExtra(), project.getId());
    }

    @Override
    public void enable(Boolean isEnable, List<String> idList) {

        int count = 0;
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for (String projectId : idList) {
                Project project = get(projectId);
                if (project.getIs_domain()) {
                    KeystoneDomain keystoneDomain = (KeystoneDomain) OSFactory.clientFromToken(token).identity().domains().get(projectId);
                    if (keystoneDomain != null) {
                        keystoneDomain = (KeystoneDomain) OSFactory.clientFromToken(token).identity().domains().update(keystoneDomain.toBuilder().enabled(project.getEnabled()).build());
                        count++;
                    }
                } else {
                    KeystoneProject keystoneProject = (KeystoneProject) OSFactory.clientFromToken(token).identity().projects().get(projectId);
                    if (project != null) {
                        keystoneProject = (KeystoneProject) OSFactory.clientFromToken(token).identity().projects().update(keystoneProject.toBuilder().enabled(isEnable).build());
                        count++;
                    }
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "用户数据库更新失败");
        }
    }

    @Override
    public List<Project> findByAll(Boolean enabled) {

        return dao.findPaginationByName(null, enabled, null);
    }

    @Override
    public Pagination<Project> findPaginationByName(String name, Pagination<Project> p) {

        dao.findPaginationByName(name, null, p);
        return p;
    }

    @Override
    public Project findByCode(String code) {

        List<Project> projects = dao.findPaginationByName(null, null, null);
        for (Project project : projects) {
            if (!StringUtils.isBlank(project.getCode()) && project.getCode().equals(code)) {
                return project;
            }
        }
        return null;
    }

    @Override
    @Transactional
    public void deleteById(List<String> idList) {

        rolePermissionService.deleteByAppIds(idList);
        permissionService.deleteByAppIds(idList);
        verifyRows(dao.deleteById(idList), idList.size(), "应用数据库删除失败");
    }

    @Override
    public void save(Project project, List<String> userIdList) {

        // 更新/创建项目
        save(project);
        // 更新项目信息
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        if (project.getIs_domain()) {
            KeystoneDomain currentDomain = (KeystoneDomain) OSFactory.clientFromToken(token).identity().domains().get(project.getId());
            OSFactory.clientFromToken(token).identity().domains().update(currentDomain.toBuilder().name(project.getName()).description(project.getDescription()).enabled(project.getEnabled()).build());
        } else {
            KeystoneProject currentProject = (KeystoneProject) OSFactory.clientFromToken(token).identity().projects().get(project.getId());
            OSFactory.clientFromToken(token).identity().projects().update(currentProject.toBuilder().name(project.getName()).description(project.getDescription()).enabled(project.getEnabled()).build());
        }
        // 更新项目用户信息
        List<ProjectUserRole> projectUserRoleList = new ArrayList<ProjectUserRole>();
        ProjectUserRole bean;
        for (String userId : userIdList) {
            Pagination<ProjectUserRole> listAssignment = new Pagination<ProjectUserRole>();
            listAssignment = projectUserRoleService.findByProjectUserRoleId(userId, null, null, listAssignment);
            if (null != listAssignment && listAssignment.getRowCount() > 0) {
                for (ProjectUserRole val : listAssignment.getList()) {
                    bean = new ProjectUserRole();
                    bean.setActor_id(userId);
                    bean.setTarget_id(project.getId());
                    bean.setRole_id(val.getRole_id());
                    projectUserRoleList.add(bean);
                }
            }
        }
        projectUserRoleService.allocate(projectUserRoleList);
    }
}