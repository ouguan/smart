package com.smart.sso.server.model;

import com.smart.mvc.model.PersistentObject;

public class Membership extends PersistentObject {

    private static final long serialVersionUID = 2206412511325860697L;
    /** 组ID */
    private String            group_id;
    /** 用户ID */
    private String            user_id;

    public String getGroup_id() {

        return group_id;
    }

    public void setGroup_id(String group_id) {

        this.group_id = group_id;
    }

    public String getUser_id() {

        return user_id;
    }

    public void setUser_id(String user_id) {

        this.user_id = user_id;
    }
}