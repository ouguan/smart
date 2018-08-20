package com.smart.sso.server.model;

import com.smart.mvc.model.PersistentObject;

/**
 * 项目用户角色映射
 * 
 * @author Joe
 */
public class ProjectUserRole extends PersistentObject {

    private static final long serialVersionUID = 5243692991213598711L;
    /** 项目类型 */
    private String            type;
    /** 项目ID */
    private String            actor_id;
    /** 用户ID */
    private String            target_id;
    /** 角色ID */
    private String            role_id;
    /** 是否继承 */
    private Boolean           inherited        = Boolean.valueOf(false);

    public String getType() {

        return type;
    }

    public void setType(String type) {

        this.type = type;
    }

    public String getActor_id() {

        return actor_id;
    }

    public void setActor_id(String actor_id) {

        this.actor_id = actor_id;
    }

    public String getTarget_id() {

        return target_id;
    }

    public void setTarget_id(String target_id) {

        this.target_id = target_id;
    }

    public String getRole_id() {

        return role_id;
    }

    public void setRole_id(String role_id) {

        this.role_id = role_id;
    }

    public Boolean getInherited() {

        return inherited;
    }

    public void setInherited(Boolean inherited) {

        this.inherited = inherited;
    }
}