package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.ProjectUserRole;

/**
 * 项目用户角色映射持久化接口
 * 
 * @author wushy
 */
public interface ProjectUserRoleDao extends Dao<ProjectUserRole, String> {

    public List<ProjectUserRole> findByProjectUserRoleId(@Param("userId") String userId, @Param("projectId") String projectId, @Param("roleId") String roleId, Pagination<ProjectUserRole> p);
    
    public int deleteByProjectIds(@Param("idList") List<String> idList);

    public int deleteByRoleIds(@Param("idList") List<String> idList);

    public int deleteByUserIds(@Param("idList") List<String> idList);
    
    public int deleteByAssignmentIds(@Param("userId") String userId, @Param("projectId") String projectId, @Param("roleId") String roleId);
}