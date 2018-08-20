package com.smart.sso.server.service.impl;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.MembershipDao;
import com.smart.sso.server.model.Membership;
import com.smart.sso.server.service.MembershipService;
import com.smart.sso.server.service.UserService;

@Service("membershipService")
public class MembershipServiceImpl extends ServiceImpl<MembershipDao, Membership, String> implements MembershipService {

    @Resource
    private UserService   userService;
    @Autowired
    private MembershipDao dao;

    @Override
    public void setDao(MembershipDao dao) {

        this.dao = dao;
    }

    @Override
    public Membership get(String id) {

        return this.dao.get(id);
    }

    @Override
    public Pagination<Membership> fingdByGroupID(String groupId, Pagination<Membership> p) {

        dao.fingdByGroupID(groupId, p);
        return p;
    }

    @Override
    public Pagination<Membership> fingdByUserID(String userId, Pagination<Membership> p) {

        dao.fingdByUserID(userId, p);
        return p;
    }

    @Override
    public Membership fingdByKey(String userId, String groupId) {

        return dao.fingdByKey(userId, groupId);
    }
}