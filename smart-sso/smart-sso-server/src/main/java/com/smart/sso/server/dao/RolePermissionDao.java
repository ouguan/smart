package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.sso.server.model.RolePermission;

/**
 * 角色权限映射持久化接口
 * 
 * @author Joe
 */
public interface RolePermissionDao extends Dao<RolePermission, String> {
	
	public List<RolePermission> findByRoleId(@Param("roleId") String roleId);
	
	public int deleteByPermissionIds(@Param("idList") List<String> idList);
	
	public int deleteByRoleIds(@Param("idList") List<String> idList);
	
	public int deleteByAppIds(@Param("idList") List<String> idList);
	
	public int deleteByAppAndRoleId(@Param("appId") String appId, @Param("roleId") String roleId);
}
