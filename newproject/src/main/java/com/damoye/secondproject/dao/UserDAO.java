package com.damoye.secondproject.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.User;


@Repository
public interface UserDAO {

	// 회원등록 처리
	public void signUpUser(User member);
	
	// (회원id 이용해서) 상세조회
	public User getMemberById(String id);
	
	// 회원목록조회
	public List<User> getAllMemberList();
}
