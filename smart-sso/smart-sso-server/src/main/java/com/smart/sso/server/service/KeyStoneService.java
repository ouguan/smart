package com.smart.sso.server.service;

import java.util.List;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.model.Result;
import com.smart.mvc.service.mybatis.Service;
import com.smart.sso.server.model.KeyStone;
import com.smart.sso.server.model.User;

public interface KeyStoneService extends Service<KeyStone, String> {

    /**
     * 登录
     * 
     * @param userid
     *            登录id
     * @param User
     *            用户信息
     * @return 用户ID和应用编码集合Map
     * @throws AuthenticationException
     *             认证异常
     */
    public Result login(String userid, User user);

    /**
     * 重置登录KeyStone Token
     * 
     * @param usertoken
     *            token(已加密)
     * @param ssoid
     */
    public void resetKeyStoneToken(byte[] usertoken, String projectid, String ssoid);

    /**
     * 根据登录名和应用ID查询分页列表
     * 
     * @param username
     *            登录名
     * @param appId
     *            应用ID
     * @param pageNo
     *            分页起始
     * @param pageSize
     *            分页记录数
     * @return
     */
    public Pagination<KeyStone> findPaginationByUserName(String username, Pagination<KeyStone> p);

    /**
     * 
     * 根据登录用户名查询
     * 
     * @author: wsy
     * @createTime: 2018年7月18日 上午10:52:49
     * @history:
     * @param username
     * @return KeyStone
     */
    public KeyStone findByUserName(String username);

    /**
     * 根据登录名和应用ID查询
     * 
     * @param userid
     *            登录名
     * @param appId
     *            应用ID
     * @return
     */
    public KeyStone findByUserId(String userid);

    /**
     * 根据登录名和应用ID查询
     * 
     * @param userid
     *            登录名
     * @param appId
     *            应用ID
     * @return
     */
    public KeyStone findBySSOId(String ssoid);

    public void save(KeyStone keystone, List<String> ssoIdList);
}