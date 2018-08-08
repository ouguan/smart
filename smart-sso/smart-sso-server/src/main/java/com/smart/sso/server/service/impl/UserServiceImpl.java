package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.openstack.identity.v3.domain.KeystoneUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.exception.ValidateException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.server.provider.PasswordProvider;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.UserDao;
import com.smart.sso.server.enums.TrueFalseEnum;
import com.smart.sso.server.model.KeyStone;
import com.smart.sso.server.model.User;
import com.smart.sso.server.model.UserRole;
import com.smart.sso.server.service.AppService;
import com.smart.sso.server.service.KeyStoneService;
import com.smart.sso.server.service.OpenstackUserService;
import com.smart.sso.server.service.UserRoleService;
import com.smart.sso.server.service.UserService;

@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, User, String> implements UserService {

    @Resource
    private UserRoleService      userRoleService;
    @Resource
    private AppService           appService;
    @Resource
    private KeyStoneService      keyStoneService;
    @Resource
    private OpenstackUserService openstackUserService;

    @Override
    @Autowired
    public void setDao(UserDao dao) {

        this.dao = dao;
    }

    @Override
    public Result login(String ip, String account, String password) {

        Result result = Result.createSuccessResult();
        User user = findByAccount(account);
        KeyStone keystone = keyStoneService.findByUserName(account);
        
        // <-- 验证用户信息 -->
        if (user == null) {
            result.setCode(ResultCode.ERROR).setMessage("登录名不存在");
        } else if (!user.getPassword().equals(PasswordProvider.encrypt(password))) {
            result.setCode(ResultCode.ERROR).setMessage("密码不正确");
        } else if (TrueFalseEnum.FALSE.getValue().equals(user.getIsEnable())) {
            result.setCode(ResultCode.ERROR).setMessage("已被用户禁用");
        } else {
            // <-- 验证KeyStone -->
            if (keystone != null) {
                try {
                    keystone = openstackUserService.login(user.getId(), account, password, keystone.getProjectid());
                    keyStoneService.save(keystone);
                } catch(ValidateException e) {
                    result.setCode(ResultCode.VALIDATE_ERROR).setMessage(e.getMessage());
                    return result;
                }
            }
            
            user.setLastLoginIp(ip);
            user.setLoginCount(user.getLoginCount() + 1);
            user.setLastLoginTime(new Date());
            user.setKeystone(keystone);
            dao.update(user);
            result.setData(user);
        }
        return result;
    }

    @Override
    public void enable(Boolean isEnable, List<String> idList) {

        verifyRows(dao.enable(isEnable, idList), idList.size(), "用户数据库更新失败");
    }

    @Override
    public void save(User t) {

        super.save(t);
    }

    @Override
    public void resetPassword(String password, List<String> idList) {

        verifyRows(dao.resetPassword(password, idList), idList.size(), "用户密码数据库重置失败");
    }

    @Override
    public Pagination<User> findPaginationByAccount(String account, Pagination<User> p) {

        dao.findPaginationByAccount(account, p);
        return p;
    }

    @Override
    public User findByAccount(String account) {

        return dao.findByAccount(account);
    }
    
    @Override
    @Transactional
    public void deleteById(List<String> idList) {

        userRoleService.deleteByUserIds(idList);
        verifyRows(dao.deleteById(idList), idList.size(), "用户数据库删除失败");
    }

    @Override
    public void updatePassword(String id, String newPassword) {

        User user = get(id);
        user.setPassword(PasswordProvider.encrypt(newPassword));
        update(user);
    }

    @Override
    public void save(User user, List<String> roleIdList) {

        // 创建Openstack  KeyStone用户
        KeystoneUser keyStoneUser = (KeystoneUser) KeystoneUser.builder()
                .name(user.getAccount())
                .password(user.getPassword())
                .enabled(user.getIsEnable())
                .defaultProjectId(user.getKeystone().getProjectid())
                .build();
        openstackUserService.createUser(user.getKeystone().getUserid(), keyStoneUser);
        
        // 创建SSO用户
        user.setPassword(PasswordProvider.encrypt(user.getPassword()));// 对密码进行加密
        save(user);
        
        // SSO用户关联KeyStone用户
        KeyStone keyStone = new KeyStone();
        keyStone.setSsoid(findByAccount(user.getAccount()).getId());
        keyStone.setUserid(user.getKeystone().getUserid());
        keyStone.setUsername(user.getAccount());
        keyStone.setProjectid(user.getKeystone().getProjectid());
        keyStone.setProjectname(user.getKeystone().getProjectname());
        keyStoneService.save(keyStone);
        
        List<UserRole> userRoleList = new ArrayList<UserRole>();
        UserRole bean;
        for (String roleId : roleIdList) {
            bean = new UserRole();
            bean.setUserId(user.getId());
            bean.setRoleId(roleId);
            userRoleList.add(bean);
        }
        userRoleService.allocate(user.getId(), userRoleList);
    }
}
