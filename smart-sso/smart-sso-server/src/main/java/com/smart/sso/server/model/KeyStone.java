package com.smart.sso.server.model;

import com.smart.mvc.model.PersistentObject;

public class KeyStone extends PersistentObject {

    private static final long serialVersionUID = 1106412532325860697L;
    /** 登录ID */
    private String            ssoid;
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

    /**
     * @return the user builder
     */
    public static KeyStoneBuilder builder() {
        return new KeyStoneBuilder();
    }

    public String getSsoid() {

        return ssoid;
    }

    public void setSsoid(String ssoid) {

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
    
    public static class KeyStoneBuilder{

        KeyStone model;

        KeyStoneBuilder() {
            this(new KeyStone());
        }

        KeyStoneBuilder(KeyStone model) {
            this.model = model;
        }

        /**
         * @see Keystone#getSsoid()
         */
        public KeyStoneBuilder ssoid(String ssoid) {
            model.ssoid = ssoid;
            return this;
        }

        /**
         * @see Keystone#getUserid()
         */
        public KeyStoneBuilder userid(String userid) {
            model.userid = userid;
            return this;
        }

        /**
         * @return the Keystone model
         */
        public KeyStone build() {
            return model;
        }

        /**
         * {@inheritDoc}
         */
        public KeyStoneBuilder from(KeyStone in) {
            if (in != null)
                this.model = in;
            return this;
        }

        /**
         * @see Keystone#getUserName()
         */
        public KeyStoneBuilder name(String username) {
            model.username = username;
            return this;
        }

        /**
         * @see Keystone#getProjectId()
         */
        public KeyStoneBuilder projectId(String projectid) {
            model.projectid = projectid;
            return this;
        }

        /**
         * @see Keystone#getProjectname()
         */
        public KeyStoneBuilder projectName(String projectname) {
            model.projectname = projectname;
            return this;
        }

        /**
         * @see Keystone#getUsertoken()
         */
        public KeyStoneBuilder userToken(byte[] usertoken) {
            model.usertoken = usertoken;
            return this;
        }

    }

    public static long getSerialversionuid() {

        return serialVersionUID;
    }
}