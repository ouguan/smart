package com.smart.sso.client;

import java.io.Serializable;

/**
 * 已登录用户信息
 * 
 * @author Joe
 */
public class SessionUser implements Serializable {

    private static final long serialVersionUID = 1764365572138947234L;
    // 登录用户访问Token
    private String            token;
    // 登录名
    private String            account;
    // 关联KeyStone信息
    private byte[]            keystone;

    public SessionUser() {

        super();
    }

    public SessionUser(String token, String account, byte[] keystone) {

        super();
        this.token = token;
        this.account = account;
        this.keystone = keystone;
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

    public byte[] getKeystone() {

        return keystone;
    }

    public void setKeystone(byte[] keystone) {

        this.keystone = keystone;
    }
}
