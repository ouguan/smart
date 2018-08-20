package com.smart.sso.server.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.openstack4j.model.identity.v3.Token;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.smart.mvc.util.StringUtils;
import com.smart.sso.rpc.AuthenticationRpcService;
import com.smart.sso.rpc.RpcPermission;
import com.smart.sso.rpc.RpcUser;
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
    public boolean validate(String key) {

        return tokenManager.validate(key) != null;
    }
    
    @Override
    public void remove(String key) {

        tokenManager.remove(key);
    }

    @Override
    public RpcUser findAuthInfo(String key) {

        Token token = tokenManager.validate(key);
        if (token != null) {
            logger.debug("KeyStone Token(过期时间) : "+ token.getExpires());
            return new RpcUser(token.getUser().getName(), SerializeUtil.serialByte(token));
        }
        return null;
    }

    @Override
    public List<RpcPermission> findPermissionList(String key, String appCode) {

        if (StringUtils.isBlank(key)) {
            return permissionService.findListById(appCode, null);
        } else {
            Token token = tokenManager.validate(key);
            if (token != null) {
                return permissionService.findListById(appCode, token.getUser().getId());
            } else {
                return new ArrayList<RpcPermission>(0);
            }
        }
    }
}
