package com.smart.sso.server.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.smart.mvc.dao.mybatis.Dao;
import com.smart.mvc.model.Pagination;
import com.smart.sso.server.model.Membership;

public interface MembershipDao extends Dao<Membership, String> {

    public Membership fingdByKey(@Param("userId") String userId, @Param("groupId") String groupId);

    public List<Membership> fingdByGroupID(@Param("groupId") String groupId, Pagination<Membership> p);

    public List<Membership> fingdByUserID(@Param("userId") String userId, Pagination<Membership> p);
}