package com.admin.service;

import java.util.List;
import java.util.Set;

import com.admin.entity.Menu;
import net.sf.json.JSONArray;
import org.apache.ibatis.annotations.Param;

public interface MenuService {

	/**
     * 
     * @param menu
     * @return
     */
    List<Menu> getPage(Menu menu);
    
    /**
     * 
     * @param menu
     * @return
     */
    List<Menu> getList(Menu menu);
    
    /**
     * 
     * @param id
     * @return
     */
    Menu get(@Param("id") Integer id);
    
    /**
     * 
     * @param menu
     * @return
     */
    int getCount(Menu menu);
    
    /**
     * 
     * @param menu
     * @return
     */
    int insert(Menu menu);
    
    /**
     * 
     * @param id
     * @return
     */
    int delete(@Param("id") Integer id);

    /**
     * 
     * @param menu
     * @return
     */
    int update(Menu menu);

    /**
     * 根据用户id获取权限
     * @param roleId
     * @return
     */
    Set<String> getPermission(Integer roleId);


    /**
     * 获取左侧导航栏的菜单
     * @param menu
     * @return
     */
    JSONArray getMenu(Menu menu);

    List<Menu> getParentId(Integer id);
}