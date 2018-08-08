package com.smart.sso.server.model;

import com.smart.mvc.model.PersistentObject;

/**
 * 用户角色映射
 * 
 * @author Joe
 */
public class UserRole extends PersistentObject {

	private static final long serialVersionUID = 4942358338145288018L;

	/** 用户ID */
	private String userId;
	/** 角色ID */
	private String roleId;

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
}
