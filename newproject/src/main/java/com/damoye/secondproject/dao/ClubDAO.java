package com.damoye.secondproject.dao;


import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;


@Repository
public interface ClubDAO {	
	
	//특정 카테고리 조회 selCategory
	//public List<CategoryDTO> getSelCategory();

	//특정 카테고리명 조회
	public String getSelCategoryName(int categoryNo) throws DataAccessException;	
	//클럽 목록 검색+조회 selClubList
	public List<ClubDTO> getSelClubList() throws DataAccessException;	
	//클럽 상세보기-클럽소개
	public ClubDTO getSelClubDetail(int cNo) throws DataAccessException;
	//클럽 상세보기-가입자 수 
	public int getClubCount(int cNo) throws DataAccessException;
	//클럽 상세보기-모임글
	public BoardVO getSelBDetail(int cNo) throws DataAccessException;
	
	//클럽 상세보기-클럽가입 아이디 리스트
	public List<ClubMemberDTO> getSignMember(int cNo) throws DataAccessException;	
	//클럽 가입
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws DataAccessException;
	//클럽 생성
	public void getCreClub(ClubDTO clubDTO) throws DataAccessException;
	//클럽수정
	public int getUpdateClub(ClubDTO clubDTO) throws DataAccessException;
	//클럽탈퇴
	public int getDel(int mNo) throws DataAccessException;
	
	

}
