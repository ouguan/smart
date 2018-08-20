package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.Project;

public interface ProjectDao extends Dao<Project, String> {

    public int updateProject(@Param("extra") byte[] extra, @Param("id") String id);

    public List<Project> findPaginationByName(@Param("name") String name, @Param("enabled") Boolean enabled, Pagination<Project> p);

    public Project findByName(@Param("name") String name);
}