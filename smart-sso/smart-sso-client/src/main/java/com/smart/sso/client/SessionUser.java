package com.smart.sso.client;

import java.io.Serializable;

/**
 * 已登录用户信息
 * 
 * @author Joe
 */
public class SessionUser implements Serializable {

    private static final long serialVersionUID = 1764365572138947234L;
    // 登录用户访问Token唯一标识s
    private String            token;
    // 登录名
    private String            account;
    // 完成认证的令牌
    private byte[]            authToken;

    public SessionUser() {

        super();
    }

    public SessionUser(String token, String account, byte[] authToken) {

        super();
        this.token = token;
        this.account = account;
        this.authToken = authToken;
    }

    public String getToken() {

        return token;
    }

    public void setToken(String token) {

        this.token = token;
    }

    public String getAccount() {

        return account;
    }

    public void setAccount(String account) {

        this.account = account;
    }

    public byte[] getAuthToken() {

        return authToken;
    }

    public void setAuthToken(byte[] authToken) {

        this.authToken = authToken;
    }
}
