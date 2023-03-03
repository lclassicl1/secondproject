package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.damoye.secondproject.model.User;


@Service
public interface UserService {

	// 회원등록처리
	public void signUpUser(User user) throws Exception;
	
	//회원 id활용
	public User getMemberById(String id);
	
	//회원 아이디 찾기
	public User findId(String name, String email, String phonenum);
	
	//회원 비밀번호 찾기
	public User findPw(String id, String name, String email);
	
	//회원 개인정보 수정
	public void modifyUserInfo(String id, String password, String email, String phonenum, String zipcode, String address, String detailaddress);
	
	// 회원목록조회
	public List<User> getAllMemberList();
}
