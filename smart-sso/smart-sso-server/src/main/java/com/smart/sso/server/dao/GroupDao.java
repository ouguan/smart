package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.Group;

public interface GroupDao extends Dao<Group, String> {

    public int updateGroup(@Param("extra") byte[] extra, @Param("id") String id);

    public List<Group> findPaginationByName(@Param("name") String name, Pagination<Group> p);

    public Group findByName(@Param("name") String name);
}