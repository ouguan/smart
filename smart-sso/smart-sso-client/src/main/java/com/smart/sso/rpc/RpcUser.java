package com.smart.sso.rpc;

import java.io.Serializable;

/**
 * RPC回传用户对象
 * 
 * @author Joe
 */
public class RpcUser implements Serializable {

    private static final long serialVersionUID = 4507869346123296527L;
    // 登录名
    private String            account;
    // 关联KeyStone Token信息
    private byte[]            token;

    public RpcUser(String account, byte[] token) {

        super();
        this.account = account;
        this.token = token;
    }

    public String getAccount() {

        return account;
    }

    public void setAccount(String account) {

        this.account = account;
    }

    public byte[] getToken() {

        return token;
    }

    public void setToken(byte[] token) {

        this.token = token;
    }
}