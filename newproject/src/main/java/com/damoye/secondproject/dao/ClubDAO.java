package com.damoye.secondproject.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.CategoryDTO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;
import com.damoye.secondproject.model.User;


@Repository
public interface ClubDAO {	

	//특정 카테고리 조회
	public String getSelCategoryName(int categoryNo) throws DataAccessException;	
	//클럽 목록 검색+조회 selClubList
	public List<ClubDTO> getSelClubList(int categoryNo) throws DataAccessException;	
	
	//검색
	public List<ClubDTO> getSearchCName(ClubDTO clubDTO) throws DataAccessException;
	//클럽 상세보기-클럽소개
	public ClubDTO getSelClubDetail(int cNo) throws DataAccessException;
	//클럽 상세보기-가입자 수 
	public int getClubCount(int cNo) throws DataAccessException;
	//클럽 상세보기-모임글
	public List<BoardVO> getSelBDetail(int cNo) throws DataAccessException;
	
	//클럽 상세보기-클럽가입 아이디 리스트
	public List<User> getSignMember(int cNo) throws DataAccessException;	
	//클럽 가입
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws DataAccessException;
	//클럽 생성
	public void getCreClub(ClubDTO clubDTO) throws DataAccessException;
	//클럽수정
	public int getUpdateClub(ClubDTO clubDTO) throws DataAccessException;
	//클럽탈퇴
	public int getUpDel(ClubMemberDTO clubMemberDTO) throws DataAccessException;
	//클럽삭제
	public int getDel(int cNo) throws DataAccessException;

}
