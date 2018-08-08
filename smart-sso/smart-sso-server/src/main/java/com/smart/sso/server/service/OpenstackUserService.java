package com.smart.sso.server.service;

import java.util.List;
import org.openstack4j.model.common.ActionResponse;
import org.openstack4j.model.identity.v3.Group;
import org.openstack4j.model.identity.v3.Role;
import org.openstack4j.model.identity.v3.User;
import com.smart.sso.server.model.KeyStone;

/**
 * Openstack用户服务接口
 * 
 * @author wsy
 */
public interface OpenstackUserService{

    /**
     * @author: zsh
     * @descript: 注册用户时，创建新的openstack用户(包括创建用户，向数据库中表T_UserT_Token中插入数据)
     * @param userName
     * @param pwd
     * @param proName
     * @param email
     * @param enabled
     * @param userId
     *            创建用户的用户的ID
     * @return User
     */
    User createUser(String userName, String pwd, String proName, String email, Boolean enabled, String userId);

    /**
     * @author: zsh
     * @descript: 注销用户时，删除相应opensta用户(包括删除用户，从数据库中表T_UserT_Token中删除数据)
     * @param deleteUserId
     *            要被删除的那个胡id
     * @param userId
     * @return ActionResponse
     */
    ActionResponse deleteUser(String deleteUserId, String userId);

    /**
     * @author: zsh
     * @descript: 用户登录，传入用户ID，用户名，密码
     * @param userId
     * @param userName
     * @param pwd
     * @return OSClientV3
     */
    KeyStone login(String ssoid, String username, String password, String projectid);

    /**
     * @author: zsh
     * @descript: 初始化超级用户
     * @param projectname
     * @param username
     * @param password
     * @return User
     */
    User initSuper(String username, String password, String projectname);

    /**
     * @author: zsh
     * @descript: 用户退出登录
     * @param userId
     *            void
     */
    void logout(String username);

    /**
     * 
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:39:45
     * @history:
     * @param userid
     * @param user
     * @return User
     */
    User createUser(String userid, User user);

    /**
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:47:34
     * @history:
     * @param userid
     * @return List<? extends User>
     */
    List<? extends User> userList(String userid);

    /**
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:49:23
     * @history:
     * @param userid
     * @param userId
     * @return User
     */
    User userById(String userid, String findId);

    /**
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:49:49
     * @history:
     * @param userid
     * @param userName
     * @return List<? extends User>
     */
    List<? extends User> userByName(String userid, String userName);

    /**
     * 
     * List Roles for User In a Domain
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:51:56
     * @history:
     * @param userid
     * @param projectId
     * @return List<? extends Role>
     */
    List<? extends Role> listRoleForUserDomain(String userid, String domainId);

    /**
     * 
     * List Roles for User In a Project
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:51:56
     * @history:
     * @param userid
     * @param projectId
     * @return List<? extends Role>
     */
    List<? extends Role> listRoleForUserProject(String userid, String projectId);

    /**
     * List Group for User TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:54:42
     * @history:
     * @param userid
     * @param userId
     * @return List<? extends Group>
     */
    List<? extends Group> listUserGroups(String userid, String userId);

    /**
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:46:10
     * @history:
     * @param userid
     * @param project
     * @return Project
     */
    User updateUser(String userid, User user);

    /**
     * TODO
     * 
     * @author: wsy
     * @createTime: 2018年6月12日 上午8:58:22
     * @history:
     * @param userid
     * @param user
     * @return ActionResponse
     */
    ActionResponse deleteUser(String userid, User user);
}