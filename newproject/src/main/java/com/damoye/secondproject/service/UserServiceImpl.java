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
	public void signUpUser(User user) throws Exception {

		//회원가입
		userDAO.signUpUser(user);
	}

	@Override
	public User getMemberById(String id) {
		
		User user = userDAO.getMemberById(id);
		
		return user;
	}

	@Override
	public User findId(String name, String email, String phonenum) {
		
		User user = userDAO.findId(name, email, phonenum);
		
		return user;
	}
	
	@Override
	public User findPw(String id, String name, String email) {
		
		User user = userDAO.findPw(id, name, email);
		
		return user;
	}
	
	@Override
	public void modifyUserInfo(String id, String password, String email, String phonenum, String zipcode, String address, String detailaddress) {
		User user = null;
		user = userDAO.getMemberById(id);
		user.changeMyInfo(password, email, zipcode, address, detailaddress);
		userDAO.modifyUserInfo(user);
	}
	
	@Override
	public List<User> getAllMemberList() {

		List<User> memberList = userDAO.getAllMemberList();
		
		return memberList;
	}

}
