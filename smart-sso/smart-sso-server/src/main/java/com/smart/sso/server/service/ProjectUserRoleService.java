package com.smart.sso.server.service;

import java.util.List;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.Service;
import com.smart.sso.server.model.ProjectUserRole;

/**
 * 项目用户角色映射服务接口
 * 
 * @author wushy
 */
public interface ProjectUserRoleService extends Service<ProjectUserRole, String> {

    /**
     * 根据项目ID、用户ID和角色ID查询映射
     * 
     * @param ProjectId
     *            项目ID
     * @param userId
     *            用户ID
     * @param roleId
     *            角色ID
     * @return
     */
    public Pagination<ProjectUserRole> findByProjectUserRoleId(String projectId, String userId, String roleId, Pagination<ProjectUserRole> p);

    /**
     * 根据用户ID给用户分配角色
     * 
     * @param userId
     *            用户ID
     * @param list
     *            用户角色映射集合
     * @return
     */
    public void allocate(List<ProjectUserRole> list);

    /**
     * 根据项目ID集合删除映射
     * 
     * @param idList
     *            项目ID集合
     * @return
     */
    public void deleteByProjectIds(List<String> idList);

    /**
     * 根据角色ID集合删除映射
     * 
     * @param idList
     *            角色ID集合
     * @return
     */
    public void deleteByRoleIds(List<String> idList);

    /**
     * 根据用户ID集合删除映射
     * 
     * @param idList
     *            用户ID集合
     * @return
     */
    public void deleteByUserIds(List<String> idList);
}