package com.smart.sso.server.service;

import java.util.List;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.Service;
import com.smart.sso.server.model.Project;

/**
 * 项目服务接口
 * 
 * @author Joe
 */
public interface ProjectService extends Service<Project, String> {

    
    /**
     * 启用禁用操作
     * @param isEnable 是否启用
     * @param idList 应用ID集合
     * @return
     */
    public void enable(Boolean isEnable, List<String> idList);
    
    /**
     * 根据名称查询
     * @param name 应用名称
     * @return
     */
    public List<Project> findByAll(Boolean isEnable);
    
    /**
     * 根据名称查询
     * @param name 应用名称
     * @return
     */
    public Project findByCode(String code);
    
    /**
     * 根据名称分页查询
     * @param name 应用名称
     * @return
     */
    public Pagination<Project> findPaginationByName(String name, Pagination<Project> p);
    
    public void save(Project project, List<String> userIdList);
}