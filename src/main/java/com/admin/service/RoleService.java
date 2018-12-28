package com.admin.service;

import java.util.List;
import java.util.Set;

import com.admin.entity.Role;
import org.apache.ibatis.annotations.Param;

public interface RoleService {

	/**
     * 
     * @param role
     * @return
     */
    List<Role> getPage(Role role);
    
    /**
     * 
     * @param role
     * @return
     */
    List<Role> getList(Role role);
    
    /**
     * 
     * @param id
     * @return
     */
    Role get(@Param("id") Integer id);
    
    /**
     * 
     * @param role
     * @return
     */
    int getCount(Role role);
    
    /**
     * 
     * @param role
     * @return
     */
    int insert(Role role);
    
    /**
     * 
     * @param id
     * @return
     */
    int delete(@Param("id") Integer id);

    /**
     * 
     * @param role
     * @return
     */
    int update(Role role);
}