package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.Role;

/**
 * 角色持久化接口
 * 
 * @author Joe
 */
public interface RoleDao extends Dao<Role, String> {

	public int enable(@Param("extra") byte[] extra, @Param("id") String id);
	
	public int updateRole(@Param("name") String name, @Param("extra") byte[] extra, @Param("id") String id);

	public List<Role> findPaginationByName(@Param("name") String name, Pagination<Role> p);
}
