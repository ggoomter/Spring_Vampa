package com.vam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.UserMapper;
import com.vam.model.UserDTO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Override
	public void join(UserDTO user) {
		mapper.join(user);
		
	}
	
	@Override
	public UserDTO login(UserDTO user) {
		UserDTO loginUser = mapper.login(user);
		return loginUser;
	}



}
