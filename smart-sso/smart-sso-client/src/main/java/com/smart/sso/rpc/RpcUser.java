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
    // 关联KeyStone信息
    private byte[]            keystone;

    public RpcUser(String account, byte[] keystone) {

        super();
        this.account = account;
        this.keystone = keystone;
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