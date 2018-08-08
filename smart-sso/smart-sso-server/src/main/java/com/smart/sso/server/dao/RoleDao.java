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

	public int enable(@Param("isEnable") Boolean isEnable, @Param("idList") List<String> idList);

	public int resetPassword(@Param("password") String password, @Param("idList") List<String> idList);

	public List<Role> findPaginationByName(@Param("name") String name, @Param("isEnable") Boolean isEnable,
			Pagination<Role> p);
}
