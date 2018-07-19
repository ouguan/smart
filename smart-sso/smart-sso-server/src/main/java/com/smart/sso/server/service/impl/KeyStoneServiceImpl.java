package com.smart.sso.server.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.model.ResultCode;
import com.smart.mvc.service.mybatis.impl.ServiceImpl;
import com.smart.sso.server.dao.KeyStoneDao;
import com.smart.sso.server.model.KeyStone;
import com.smart.sso.server.model.User;
import com.smart.sso.server.service.KeyStoneService;

@Service("keyStoneService")
public class KeyStoneServiceImpl extends ServiceImpl<KeyStoneDao, KeyStone, Integer> implements KeyStoneService {
    
    @Override
    @Autowired
    public void setDao(KeyStoneDao dao) {
        this.dao = dao;
    }

    @Override
    @Transactional
    public Result login(String userid, User user) {

        Result result = Result.createSuccessResult();
        KeyStone keystone = findByUserId(userid);
        if (keystone == null) {
            result.setCode(ResultCode.ERROR).setMessage("登录名在KeyStone中不存在");
        }
        else {
            keystone.setUsername(user.getAccount());
            keystone.setProjectid(user.getKeystone().getProjectid());
            keystone.setUsertoken(user.getKeystone().getUsertoken());
            dao.update(keystone);
            result.setData(keystone);
        }
        return result;
    }

    @Override
    @Transactional
    public void resetKeyStoneToken(byte[] usertoken, String projectid, Integer ssoid) {
        verifyRows(dao.resetKeyStoneToken(usertoken, projectid, ssoid), 1, "KeyStone立牌信息数据库重置失败");
    }

    @Override
    public Pagination<KeyStone> findPaginationByUserName(String username, Pagination<KeyStone> p) {

        dao.findPaginationByUserName(username, p);
        return p;
    }
    
    @Override
    public KeyStone findByUserName(String username) {

        return dao.findByUserName(username);
    }

    @Override
    public KeyStone findByUserId(String userid) {

        return dao.findByUserId(userid);
    }

    @Override
    public KeyStone findBySSOId(Integer ssoid) {

        return dao.findBySSOId(ssoid);
    }

    @Override
    @Transactional
    public void deleteById(List<Integer> idList) {
        verifyRows(dao.deleteById(idList), idList.size(), "用户数据库删除KeyStone信息失败");
    }

    @Override
    public void save(KeyStone user, List<Integer> ssoIdList) {
        save(user);
    }   
    
    @Override
    public void save(KeyStone t) {
        super.save(t);
    }
}