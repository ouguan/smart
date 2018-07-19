package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.KeyStone;

public interface KeyStoneDao extends Dao<KeyStone, Integer> {

    public KeyStone findBySSOId(@Param("ssoid") Integer ssoid);

    public KeyStone findByUserId(@Param("userid") String userid);

    public KeyStone findByUserName(@Param("username") String username);
    
    public List<KeyStone> findPaginationByUserName(@Param("username") String username, Pagination<KeyStone> p);
    
    public int resetKeyStoneToken(@Param("usertoken") byte[] usertoken, @Param("projectid") String projectid, @Param("ssoid") Integer ssoid);
}