package com.admin.service;

import java.util.List;

import com.admin.entity.Authority;
import org.apache.ibatis.annotations.Param;

public interface AuthorityService {

	/**
     * 
     * @param authority
     * @return
     */
    List<Authority> getPage(Authority authority);
    
    /**
     * 
     * @param authority
     * @return
     */
    List<Authority> getList(Authority authority);
    
    /**
     * 
     * @param id
     * @return
     */
    Authority get(@Param("id") Integer id);
    
    /**
     * 
     * @param authority
     * @return
     */
    int getCount(Authority authority);
    
    /**
     * 
     * @param authority
     * @return
     */
    int insert(Authority authority);
    
    /**
     * 
     * @param id
     * @return
     */
    int delete(@Param("id") Integer id);

    /**
     * 
     * @param authority
     * @return
     */
    int update(Authority authority);

}