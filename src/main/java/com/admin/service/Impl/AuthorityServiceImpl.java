package com.admin.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.entity.Authority;
import com.admin.mapper.AuthorityMapper;
import com.admin.service.AuthorityService;

import java.util.List;

@Service("authorityService")
public class AuthorityServiceImpl implements AuthorityService{

	@Autowired
	AuthorityMapper authorityMapper;

	@Override
	public List<Authority> getPage(Authority authority) {
		return authorityMapper.getPage(authority);
	}

	@Override
	public List<Authority> getList(Authority authority) {
		return authorityMapper.getList(authority);
	}

	@Override
	public Authority get(Integer id) {
		return authorityMapper.get(id);
	}

	@Override
	public int getCount(Authority authority) {
		return authorityMapper.getCount(authority);
	}

	@Override
	public int insert(Authority authority) {
		return authorityMapper.insert(authority);
	}

	@Override
	public int delete(Integer id) {
		return authorityMapper.delete(id);
	}

	@Override
	public int update(Authority authority) {
		return authorityMapper.update(authority);
	}
}