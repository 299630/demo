package com.admin.service;

import java.util.List;

import com.admin.entity.User;

public interface UserService {

	/**
     * 
     * @param user
     * @return
     */
    List<User> getPage(User user);
    
    /**
     * 
     * @param user
     * @return
     */
    List<User> getList(User user);
    
    /**
     * 根据登录账户获取用户信息
     * @param loginName
     * @return
     */
    User get(String loginName);
    
    /**
     * 
     * @param user
     * @return
     */
    int getCount(User user);
    
    /**
     * 
     * @param user
     * @return
     */
    int insert(User user);
    
    /**
     * 
     * @param id
     * @return
     */
    int delete(Integer id);

    /**
     * 
     * @param user
     * @return
     */
    int update(User user);
    /**
     * 修改主题
     * @param user
     * @return
     */
    int theme(User user);

    /**
     * 修改头像
     * @param fileName
     * @return
     */
    int upload(String fileName);
}