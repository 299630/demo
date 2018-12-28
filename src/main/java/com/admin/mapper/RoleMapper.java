package com.admin.mapper;

import java.util.List;

import com.admin.entity.Role;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper {

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