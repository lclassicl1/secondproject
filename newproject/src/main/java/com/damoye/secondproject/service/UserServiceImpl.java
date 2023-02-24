package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.UserDAO;
import com.damoye.secondproject.model.User;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	// 회원등록
	@Override
	public void signUpUser(User member) {
		
		userDAO.signUpUser(member);
	}

	@Override
	public User getMemberById(String id) {
		
		User user = userDAO.getMemberById(id);
		
		return user;
	}

	@Override
	public List<User> getAllMemberList() {

		List<User> memberList = userDAO.getAllMemberList();
		
		return memberList;
	}
}
