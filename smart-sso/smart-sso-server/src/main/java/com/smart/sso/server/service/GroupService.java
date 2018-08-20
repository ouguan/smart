package com.smart.sso.server.service;

import java.util.List;
import com.smart.mvc.model.Pagination;
import com.smart.mvc.service.mybatis.Service;
import com.smart.sso.server.model.Group;
import com.smart.sso.server.model.User;

public interface GroupService extends Service<Group, String> {

    /**
     * 组成员列表
     * 
     * @author: wsy
     * @createTime: 2018年8月20日 下午2:14:24
     * @history:
     * @param groupId
     * @return List<User>
     */
    List<User> listGroupUser(String groupId);

    /**
     * 启用禁用操作
     * 
     * @param isEnable
     *            是否启用
     * @param idList
     *            用户ID集合
     * @return
     */
    public void enable(Boolean isEnable, List<String> idList);

    /**
     * 根据登录名和应用ID查询分页列表
     * 
     * @param name
     *            组名称
     * @param pageNo
     *            分页起始
     * @param pageSize
     *            分页记录数
     * @return
     */
    public Pagination<Group> findPaginationByName(String name, Pagination<Group> p);

    /**
     * 根据登录名和应用ID查询
     * 
     * @param name
     *            登录名
     * @return
     */
    public Group findByName(String name);

    public void save(Group group, List<String> userIdList);
}