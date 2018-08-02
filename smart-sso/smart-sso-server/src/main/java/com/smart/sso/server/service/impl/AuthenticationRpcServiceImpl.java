package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.client.openstack.OpenstackAuth;
import com.smart.sso.rpc.AuthenticationRpcService;
import com.smart.sso.rpc.RpcPermission;
import com.smart.sso.rpc.RpcUser;
import com.smart.sso.server.common.LoginUser;
import com.smart.sso.server.common.TokenManager;
import com.smart.sso.server.service.PermissionService;
import com.smart.sso.server.service.UserService;
import com.smart.sso.server.util.SerializeUtil;

@Service("authenticationRpcService")
public class AuthenticationRpcServiceImpl implements AuthenticationRpcService {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    
    @Resource
    private PermissionService permissionService;
    @Resource
    private UserService       userService;
    @Resource
    private TokenManager      tokenManager;

    @Override
    public boolean validate(String token) {

        return tokenManager.validate(token) != null;
    }
    
    @Override
    public void remove(String token) {

        tokenManager.remove(token);
    }

    @Override
    public RpcUser findAuthInfo(String token) {

        LoginUser user = tokenManager.validate(token);
        OpenstackAuth keystone;
        if (user != null) {
            keystone = new OpenstackAuth();
            keystone.setSsoid(user.getKeystone().getSsoid());
            keystone.setUserid(user.getKeystone().getUserid());
            keystone.setUsername(user.getKeystone().getUsername());
            keystone.setProjectid(user.getKeystone().getProjectid());
            keystone.setUsertoken(user.getKeystone().getUsertoken());
            
            logger.debug("KeyStone Token(过期时间) : "+SerializeUtil.bytesToToken(user.getKeystone().getUsertoken()).getExpires());
            return new RpcUser(user.getAccount(), SerializeUtil.serialByte(keystone));
        }
        return null;
    }

    @Override
    public List<RpcPermission> findPermissionList(String token, String appCode) {

        if (StringUtils.isBlank(token)) {
            return permissionService.findListById(appCode, null);
        } else {
            LoginUser user = tokenManager.validate(token);
            if (user != null) {
                return permissionService.findListById(appCode, user.getUserId());
            } else {
                return new ArrayList<RpcPermission>(0);
            }
        }
    }
}
