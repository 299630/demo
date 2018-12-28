package com.admin.mapper;

import java.util.List;

import com.admin.entity.Menu;
import org.apache.ibatis.annotations.Param;

public interface MenuMapper {

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
    List<String> getPermission(@Param("roleId") Integer roleId);

    /**
     * 根据id查询是否存在子菜单
     * @param id
     * @return
     */
    List<Menu> getMenu(@Param("id") Integer id);

    List<Menu> getParentId(@Param("id") Integer id);
}