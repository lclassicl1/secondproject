package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.damoye.secondproject.model.User;


@Service
public interface UserService {

	// 회원등록처리
	public void signUpUser(User user);
	
	// (회원id 이용해서) 상세조회
	public User getMemberById(String id);
	
	// 회원목록조회
	public List<User> getAllMemberList();
}
