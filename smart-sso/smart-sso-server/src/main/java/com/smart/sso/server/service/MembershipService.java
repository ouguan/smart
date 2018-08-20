package com.smart.sso.server.service;

import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.Service;
import com.smart.sso.server.model.Membership;

public interface MembershipService extends Service<Membership, String> {

    /**
     * 根据登录名和应用ID查询
     * 
     * @param account
     *            登录名
     * @param appId
     *            应用ID
     * @return
     */
    public Pagination<Membership> fingdByGroupID(String groupId, Pagination<Membership> p);

    /**
     * 根据登录名和应用ID查询
     * 
     * @param account
     *            登录名
     * @param appId
     *            应用ID
     * @return
     */
    public Pagination<Membership> fingdByUserID(String userId, Pagination<Membership> p);

    public Membership fingdByKey(String userId, String groupId);
}