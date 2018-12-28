package com.admin.service.Impl;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.entity.User;
import com.admin.mapper.UserMapper;
import com.admin.service.UserService;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> getPage(User user) {
		return userMapper.getPage(user);
	}

	@Override
	public List<User> getList(User user) {
		return userMapper.getList(user);
	}

	@Override
	public User get(String loginName) {
		return userMapper.get(loginName);
	}

	@Override
	public int getCount(User user) {
		return userMapper.getCount(user);
	}

	@Override
	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public int delete(Integer id) {
		return userMapper.delete(id);
	}

	@Override
	public int update(User user) {
		return userMapper.update(user);
	}

	@Override
	public int theme(User user) {
		return userMapper.theme(user);
	}

	@Override
	public int upload(String fileName) {
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		return userMapper.upload(user.setImg(fileName));
	}
}