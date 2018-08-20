package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.api.Builders;
import org.openstack4j.model.common.ActionResponse;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.openstack4j.openstack.identity.v3.domain.KeystoneGroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smart.mvc.exception.ServiceException;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.dao.GroupDao;
import com.smart.sso.server.model.Group;
import com.smart.sso.server.model.Membership;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.GroupService;
import com.smart.sso.server.service.MembershipService;
import com.smart.sso.server.service.UserService;

@Service("groupService")
public class GroupServiceImpl extends ServiceImpl<GroupDao, Group, String> implements GroupService {

    @Resource
    private UserService       userService;
    @Resource
    private MembershipService membershipService;
    @Autowired
    private GroupDao          dao;

    @Override
    public void setDao(GroupDao dao) {

        this.dao = dao;
    }

    @Override
    public Group get(String id) {

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
            for (String groupId : idList) {
                KeystoneGroup keystoneGroup = (KeystoneGroup) OSFactory.clientFromToken(token).identity().groups().get(groupId);
                if (keystoneGroup != null) {
                    Group groups = get(keystoneGroup.getId());
                    groups.setIsEnable(isEnable);
                    groups.updateExtra();
                    this.dao.updateGroup(groups.getExtra(), groupId);
                }
            }
        } catch (Exception e) {
            verifyRows(count, idList.size(), "用户数据库更新失败");
        }
    }

    @Override
    public Pagination<Group> findPaginationByName(String name, Pagination<Group> p) {

        dao.findPaginationByName(name, p);
        return p;
    }

    @Override
    public Group findByName(String name) {

        return dao.findByName(name);
    }

    /**
     * 
     * 获取组成员
     * 
     * @author: wsy
     * @createTime: 2018年8月20日 下午2:00:01
     * @history:
     * @param groupId
     * @return List<User>
     */
    @Override
    public List<User> listGroupUser(String groupId) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        List<User> ret = new ArrayList<User>();
        Pagination<Membership> userList = new Pagination<Membership>();
        membershipService.fingdByGroupID(groupId, userList);
        
        for (Membership val : userList.getList()) {
            ret.add(userService.get(val.getUser_id()));
        }
        return ret;
    }

    @Override
    public void save(Group group) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        if (group.getId() == null) {
            KeystoneGroup newGroup = (KeystoneGroup) OSFactory.clientFromToken(token).identity().groups().create(Builders.group().name(group.getName()).description(group.getDescription()).build());
            group.setId(newGroup.getId());
        } else {
            KeystoneGroup keystoneGroup = (KeystoneGroup) OSFactory.clientFromToken(token).identity().groups().get(group.getId());
            keystoneGroup = (KeystoneGroup) OSFactory.clientFromToken(token).identity().groups().update(keystoneGroup.toBuilder().name(group.getName()).description(group.getDescription()).build());
        }
        this.dao.updateGroup(group.getExtra(), group.getId());
    }

    @Override
    public void save(Group group, List<String> userIdList) {

        // 创建SSO用户
        save(group);
        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        // 更新组成员用户信息
        for (String userId : userIdList) {
            if (!OSFactory.clientFromToken(token).identity().groups().checkGroupUser(group.getId(), userId).isSuccess()) {
                OSFactory.clientFromToken(token).identity().groups().addUserToGroup(group.getId(), userId);
            }
        }
    }

    public Result addGroupUser(String groupId, String userId) {

        Token token = BaseController.getLoginToken();
        if (token == null) {
            verifyRows(new ServiceException(), "登录令牌已失效");
        }
        Result result = Result.createSuccessResult();
        ActionResponse action = OSFactory.clientFromToken(token).identity().groups().addUserToGroup(groupId, userId);
        if (action.isSuccess()) {
            result.setCode(ResultCode.APPLICATION_ERROR).setMessage("添加组成员失败");
        }
        return result;
    }
}