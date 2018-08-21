package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.api.Builders;
import org.openstack4j.api.exceptions.AuthenticationException;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.openstack4j.openstack.identity.v3.domain.KeystoneUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smart.mvc.exception.ServiceException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.dao.UserDao;
import com.smart.sso.server.enums.TrueFalseEnum;
import com.smart.sso.server.model.Project;
import com.smart.sso.server.model.ProjectUserRole;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.OpenstackUserService;
import com.smart.sso.server.service.ProjectService;
import com.smart.sso.server.service.ProjectUserRoleService;
import com.smart.sso.server.service.UserService;

@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, User, String> implements UserService {

    @Resource
    private ProjectService         projectService;
    @Resource
    private ProjectUserRoleService projectUserRoleService;
    @Resource
    private OpenstackUserService   openstackUserService;
    @Autowired
    private UserDao                dao;

    @Override
    public void setDao(UserDao dao) {

        this.dao = dao;
    }

    @Override
    public User get(String id) {

        return this.dao.get(id);
    }

    @Override
    public Result login(String ip, String account, String password, String server) {

        Result result = Result.createSuccessResult();
        Project project = projectService.findByCode(server);
        User user = findByAccount(account);
        try {
            // <-- 验证项目是否已注册服务 -->
            if (project == null) {
                result.setCode(ResultCode.ERROR).setMessage("服务项目不存在");
                return result;
            }
            // <-- 验证用户是否存在信息 -->
            if (user == null) {
                result.setCode(ResultCode.ERROR).setMessage("登录名不存在");
                return result;
            }
            Token token = openstackUserService.login(account, password, project.getName());
            // <-- 验证用户信息 -->
            if (token == null) {
                result.setCode(ResultCode.ERROR).setMessage("登录验证失败");
            } else if (TrueFalseEnum.FALSE.getValue().equals(token.getUser().isEnabled())) {
                result.setCode(ResultCode.ERROR).setMessage("已被用户禁用");
            } else {
                result.setData(token);
            }
            BaseController.init(user, token);
        } catch (AuthenticationException e) {
            result.setCode(ResultCode.ERROR).setMessage("凭据无效");
        }
        return result;
    }

    @Override
    public void enable(Boolean isEnable, List<String> idList) {

        int count = 0;
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for (String userId : idList) {
                KeystoneUser user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().get(userId);
                if (user != null) {
                    user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().update(user.toBuilder().enabled(isEnable).build());
                    count++;
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "用户数据库更新失败");
        }
    }

    @Override
    public void save(User user) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        if (user.getId() == null) {
            KeystoneUser newUser = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().create(Builders.user().name(user.getAccount()).description(user.getDescription()).password(user.getPassword()).email(user.getEmail()).domainId(user.getDomain_id()).build());
            user.setId(newUser.getId());
        }
        this.dao.updateLogin(user.getExtra(), user.getId());
    }

    @Override
    public void resetPassword(String password, List<String> idList) {

        int count = 0;
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for (String userId : idList) {
                KeystoneUser user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().get(userId);
                if (user != null) {
                    user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().update(user.toBuilder().password(password).build());
                    count++;
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "用户密码数据库重置失败");
        }
    }

    @Override
    public Pagination<User> findPaginationByAccount(String account, Pagination<User> p) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        dao.findPaginationByAccount(account, p);
        return p;
    }

    @Override
    public User findByAccount(String account) {

        return dao.findByAccount(account);
    }

    @Override
    public void deleteById(List<String> idList) {

        int count = 0;
        projectUserRoleService.deleteByUserIds(idList);
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            for (String userId : idList) {
                OSFactory.clientFromToken(token).identity().users().delete(userId);
                count++;
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "用户数据库删除失败");
        }
    }

    @Override
    public void updatePassword(String id, String newPassword) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        try {
            KeystoneUser user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().get(id);
            if (user != null) {
                user = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().update(user.toBuilder().password(newPassword).build());
            }
        } catch (Exception e) {
            verifyRows(0, 1, "用户密码数据库重置失败");
        }
    }

    @Override
    public void save(User user, List<String> roleIdList) {

        // 创建SSO用户
        save(user);
        // 更新用户信息
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        KeystoneUser currentUser = (KeystoneUser) OSFactory.clientFromToken(token).identity().users().get(user.getId());
        OSFactory.clientFromToken(token).identity().users().update(currentUser.toBuilder().name(user.getAccount()).description(user.getDescription()).email(user.getEmail()).enabled(user.getIsEnable()).build());
        // 更新用户密码
        if (StringUtils.isBlank(user.getPassword())) {
            updatePassword(user.getId(), user.getPassword());
        }
        // 更新用户角色信息
        List<ProjectUserRole> projectUserRoleList = new ArrayList<ProjectUserRole>();
        ProjectUserRole bean;
        for (String roleId : roleIdList) {
            bean = new ProjectUserRole();
            bean.setActor_id(user.getId());
            bean.setTarget_id(null);
            bean.setRole_id(roleId);
            projectUserRoleList.add(bean);
        }
        projectUserRoleService.allocate(projectUserRoleList);
    }
}
