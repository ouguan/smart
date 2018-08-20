package com.smart.sso.server.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.api.OSClient.OSClientV3;
import org.openstack4j.api.exceptions.ConnectionException;
import org.openstack4j.core.transport.Config;
import org.openstack4j.model.common.ActionResponse;
import org.openstack4j.model.common.Identifier;
import org.openstack4j.model.identity.v3.Group;
import org.openstack4j.model.identity.v3.Project;
import org.openstack4j.model.identity.v3.Role;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.model.identity.v3.User;
import org.openstack4j.openstack.OSFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.config.ConfigUtils;
import com.smart.mvc.exception.ValidateException;
import com.smart.sso.server.controller.common.BaseController;
import com.smart.sso.server.service.OpenstackUserService;
import com.smart.sso.server.service.UserService;

@Service("openstackUserService")
public class OpenstackUserServiceImpl implements OpenstackUserService {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    
    @Resource
    private UserService userService;

    private OSClientV3 getOSClientV3(String userid) {

        Token token = BaseController.getLoginToken();
        return OSFactory.clientFromToken(token);
    }

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
    @Override
    @Transactional
    public User createUser(String userName, String pwd, String proName, String email, Boolean enabled, String userId) {

        User newUser = getOSClientV3(userId).identity().users().create(proName, userName, pwd, email, enabled);
        return newUser;
    }

    /**
     * @author: zsh
     * @descript: 注销用户时，删除相应opensta用户(包括删除用户，从数据库中表T_UserT_Token中删除数据)
     * @param deleteUserId
     *            要被删除的那个胡id
     * @param userId
     * @return ActionResponse
     */
    @Override
    @Transactional
    public ActionResponse deleteUser(String deleteUserId, String userId) {

        ActionResponse response = getOSClientV3(userId).identity().users().delete(deleteUserId);
        return response;
    }

    @Override
    @Transactional
    public Token login(String username, String password) throws ValidateException{

        return login(username,password,null);
    }

    /**
     * @author: zsh
     * @descript: 用户登录，传入用户ID，用户名，密码
     * @param userId
     * @param userName
     * @param pwd
     * @return OSClientV3
     */
    @Override
    @Transactional
    public Token login(String username, String password, String projectid) throws ValidateException{

        OSClientV3 userOs;
        String projectname = null;
        
        userOs = userAuthenticate(username, password);
        Token  token = userOs.getToken();
        List<? extends Project> projects = userOs.identity().tokens().getProjectScopes(token.getId());
        for(Project val : projects) {
            if(val.getId().equals(projectid)) {
                projectname = val.getName();
                break;
            }
        }
        
        if(projectname == null && projects.size() > 0){
            projectid = projects.get(0).getId();
            projectname = projects.get(0).getName();
        }
        
        if(projectname != null) {
            userOs = userAuthenticate(username, password, projectname);
        }
        
        logger.debug("KeyStone Token(过期时间) : " + userOs.getToken().getExpires());
        return userOs.getToken();
    }

    /**
    * @author: cao  
    * @descript:  使用用户名、密码、项目名创建OSClient
    * @param userName
    * @param pwd
    * @param proName
    * @return OSClientV3
     */
    public OSClientV3 userAuthenticate(String username,String password,String projectname) throws ValidateException{
        
        logger.info("Openstack访问URL地址："+ConfigUtils.getProperty("openstack.url"));
        OSClientV3 commonOs;
        try {
            commonOs = OSFactory.builderV3()
                    .endpoint(ConfigUtils.getProperty("openstack.url"))
                    .credentials(username, password, Identifier.byName("default"))
                    .scopeToProject(Identifier.byName(projectname),Identifier.byName("default"))
                    .withConfig(Config.newConfig().withConnectionTimeout(Integer.valueOf(ConfigUtils.getProperty("sso.timeout")))
                                                  .withReadTimeout((Integer.valueOf(ConfigUtils.getProperty("sso.timeout")))))
                    .authenticate();
        }catch(ConnectionException e) {
            throw new ValidateException("OpenStack访问异常！可能原因：OpenStack服务URL地址错误,登录信息错误,OpenStack服务未启用！");
        }
        return commonOs;
    }
    
    /**
    * @author: cao  
    * @descript:  使用用户名、密码创建OSClient
    * @param userName
    * @param pwd
    * @return OSClientV3
     */
    public OSClientV3 userAuthenticate(String username,String password) throws ValidateException{
        logger.info("Openstack访问URL地址："+ConfigUtils.getProperty("openstack.url"));
        OSClientV3 commonOs;
        try {
            commonOs = OSFactory.builderV3()
                    .endpoint(ConfigUtils.getProperty("openstack.url"))
                    .credentials(username, password, Identifier.byName("default"))
                    .withConfig(Config.newConfig().withConnectionTimeout(Integer.valueOf(ConfigUtils.getProperty("sso.timeout")))
                                                  .withReadTimeout((Integer.valueOf(ConfigUtils.getProperty("sso.timeout")))))
                    .authenticate();
        }catch(ConnectionException e) {
            throw new ValidateException("OpenStack访问异常！可能原因：OpenStack服务URL地址错误,登录信息错误,OpenStack服务未启用！");
        }
        return commonOs;
    }
    
    /**
     * @author: zsh
     * @descript: 初始化超级用户
     * @param projectname
     * @param username
     * @param password
     * @return User
     */
    @Override
    @Transactional
    public User initSuper(String username, String password, String projectname) {

        OSClientV3 commonOs = OSFactory.builderV3().endpoint(ConfigUtils.getProperty("openstack.url")).credentials(username, password, Identifier.byName("default")).authenticate();
        User superUser = commonOs.identity().users().getByName(username, "default");
        return superUser;
    }

    /**
     * @author: zsh
     * @descript: 用户退出登录
     * @param userId
     *            void
     */
    @Override
    @Transactional
    public void logout(String username) {

    }

    @Override
    @Transactional
    public User createUser(String userid, User user) {

        //TODO  
        return getOSClientV3(userid).identity().users().create(user);
    }

    @Override
    @Transactional
    public List<? extends User> userList(String userid) {

        //TODO  
        return getOSClientV3(userid).identity().users().list();
    }

    @Override
    @Transactional
    public User userById(String userid, String findId) {

        //TODO  
        if (findId == null || findId.trim().length() == 0) {
            return null;
        }
        return getOSClientV3(userid).identity().users().get(findId);
    }

    @Override
    @Transactional
    public List<? extends User> userByName(String userid, String userName) {

        //TODO  
        return getOSClientV3(userid).identity().users().getByName(userName);
    }

    @Override
    @Transactional
    public List<? extends Role> listRoleForUserDomain(String userid, String domainId) {

        //TODO  
        return getOSClientV3(userid).identity().users().listProjectUserRoles(userid, domainId);
    }

    @Override
    @Transactional
    public List<? extends Role> listRoleForUserProject(String userid, String projectId) {

        //TODO  
        return getOSClientV3(userid).identity().users().listProjectUserRoles(userid, projectId);
    }

    @Override
    @Transactional
    public List<? extends Group> listUserGroups(String userid, String userId) {

        //TODO  
        return getOSClientV3(userid).identity().users().listUserGroups(userId);
    }

    @Override
    @Transactional
    public User updateUser(String userid, User user) {

        //TODO  
        if (user != null)
            return getOSClientV3(userid).identity().users().update(user);
        return null;
    }

    @Override
    @Transactional
    public ActionResponse deleteUser(String userid, User user) {

        //TODO  
        return getOSClientV3(userid).identity().users().delete(user.getId());
    }
}