package com.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.entity.Role;
import com.admin.mapper.RoleMapper;
import com.admin.service.RoleService;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Autowired
	RoleMapper roleMapper;

	@Override
	public List<Role> getPage(Role role) {
		return roleMapper.getPage(role);
	}

	@Override
	public List<Role> getList(Role role) {
		return roleMapper.getList(role);
	}

	@Override
	public Role get(Integer id) {
		return roleMapper.get(id);
	}

	@Override
	public int getCount(Role role) {
		return roleMapper.getCount(role);
	}

	@Override
	public int insert(Role role) {
		return roleMapper.insert(role);
	}

	@Override
	public int delete(Integer id) {
		return roleMapper.delete(id);
	}

	@Override
	public int update(Role role) {
		return roleMapper.update(role);
	}
}