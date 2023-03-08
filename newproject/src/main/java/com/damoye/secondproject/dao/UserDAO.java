package com.damoye.secondproject.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.User;



@Repository
public interface UserDAO {

	// 회원등록 처리
	public void signUpUser(User member);
	
	//회원 id활용
	public User getMemberById(String id);
	
	//회원 아이디 찾기
	public User findId(String name,String email, String phonenum);
	
	//임시 비밀번호 변경
	public void updatePw(User user);
	
	//회원 개인정보 수정
	public void modifyUserInfo(User user);
	
	//아이디 중복 확인
	public Integer checkId(String id);
	
	// 회원목록조회
	public List<User> getAllMemberList();
}
