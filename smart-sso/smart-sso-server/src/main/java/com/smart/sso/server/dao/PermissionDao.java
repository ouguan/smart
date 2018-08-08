package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.sso.rpc.RpcPermission;
import com.smart.sso.server.model.Permission;

/**
 * 权限持久化接口
 * 
 * @author Joe
 */
public interface PermissionDao extends Dao<Permission, String> {
	
	public int enable(@Param("isEnable") Boolean isEnable, @Param("idList") List<String> idList);
	
	public int resetPassword(@Param("password") String password, @Param("idList") List<String> idList);

	public List<Permission> findByAppId(@Param("appId") String appId, @Param("isEnable") Boolean isEnable);
	
	public int deleteByAppIds(@Param("idList") List<String> idList);
	
	public List<RpcPermission> findListById(@Param("appCode") String appCode, @Param("userId") String userId);
}
