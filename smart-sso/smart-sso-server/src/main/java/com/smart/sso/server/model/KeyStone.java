package com.smart.sso.server.model;

import com.smart.mvc.model.PersistentObject;

public class KeyStone extends PersistentObject {

    private static final long serialVersionUID = 1106412532325860697L;
    /** 登录ID */
    private Integer           ssoid;
    /** KeyStone登录ID */
    private String            userid;
    /** KeyStone登录名 */
    private String            username;
    /** KeyStone登录Token */
    private byte[]            usertoken;
    /** KeyStone登录工程ID */
    private String            projectid;
    /** KeyStone登录工程名称 */
    private String            projectname;

    public Integer getSsoid() {

        return ssoid;
    }

    public void setSsoid(Integer ssoid) {

        this.ssoid = ssoid;
    }

    public String getUserid() {

        return userid;
    }

    public void setUserid(String userid) {

        this.userid = userid;
    }

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {

        this.username = username;
    }

    public byte[] getUsertoken() {

        return usertoken;
    }

    public void setUsertoken(byte[] usertoken) {

        this.usertoken = usertoken;
    }

    public String getProjectid() {

        return projectid;
    }

    public void setProjectid(String projectid) {

        this.projectid = projectid;
    }

    public String getProjectname() {

        return projectname;
    }

    public void setProjectname(String projectname) {

        this.projectname = projectname;
    }

    public static long getSerialversionuid() {

        return serialVersionUID;
    }
}