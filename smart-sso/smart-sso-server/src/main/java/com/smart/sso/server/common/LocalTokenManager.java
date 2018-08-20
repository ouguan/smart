package com.smart.sso.server.common;

import java.util.Date;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import org.openstack4j.model.common.Identifier;
import org.openstack4j.model.identity.v3.Token;
import org.openstack4j.openstack.OSFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 单实例环境令牌管理
 * 
 * @author Joe
 */
public class LocalTokenManager extends TokenManager {

    private final Logger                           logger   = LoggerFactory.getLogger(getClass());
    // 令牌存储结构
    private final ConcurrentHashMap<String, Token> tokenMap = new ConcurrentHashMap<String, Token>();

    @Override
    public void verifyExpired() {

        Date now = new Date();
        for (Entry<String, Token> entry : tokenMap.entrySet()) {
            String key = entry.getKey();
            Token token = entry.getValue();
            // 当前时间大于过期时间
            if (now.compareTo(token.getExpires()) > 0) {
                // 已过期，清除对应token
                if (now.compareTo(token.getExpires()) > 0) {
                    tokenMap.remove(key);
                    logger.debug("token : " + key + "已失效");
                }
            }
        }
    }

    @Override
    public void addToken(String key, Token token) {

        extendExpiredTime(token);
        tokenMap.putIfAbsent(key, token);
    }

    @Override
    public Token validate(String key) {

        Token token = tokenMap.get(key);
        if (token == null) {
            return null;
        }
        // 重新扩展KeyStone Token信息
        if(token.getProject() == null) {
            token = OSFactory.builderV3().endpoint(token.getEndpoint())
                                         .token(token.getId())
                                         .authenticate()
                                         .getToken();
        } else {
            token = OSFactory.builderV3().endpoint(token.getEndpoint())
                                         .scopeToProject(Identifier.byName(token.getProject().getName()), Identifier.byId(token.getProject().getDomain().getId()))
                                         .token(token.getId())
                                         .authenticate()
                                         .getToken();
        }

        extendExpiredTime(token);
        return token;
    }

    @Override
    public void remove(String token) {

        tokenMap.remove(token);
    }

    /**
     * 扩展过期时间
     * 
     * @param dummyUser
     */
    private void extendExpiredTime(Token token) {

        //dummyUser.expired = new Date(new Date().getTime() + tokenTimeout * 1000);
        logger.debug("SSO Token(过期时间) : " + token.getExpires());
    }

}
