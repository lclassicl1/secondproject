package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;

@Service
public interface ClubService {

	//특정 카테고리 조회 selCategory
	//public List<CategoryDTO> getSelCategory();
	
	//특정 카테고리명 조회
	public String getSelCategoryName(int categoryNo) throws Exception;
	//클럽 목록 검색+조회 selClubList
	public List<ClubDTO> getSelClubList() throws Exception;
	//클럽 상세보기-소개글
	public ClubDTO getSelClubDetail(int cNo) throws Exception;
	//클럽 상세보기-가입자수
	public int getClubCount(int cNo) throws Exception;
	//클럽 상세보기-모임글
	public BoardVO getSelBDetail(int cNo) throws Exception;
	//클럽 상세보기-클럽가입 아이디 리스트
	public List<ClubMemberDTO> getSignMember(int cNo) throws Exception;	
	//클럽 가입하기
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws Exception;	
	//클럽 생성
	public void getCreClub(ClubDTO clubDTO) throws Exception;
	//클럽수정-폼요청
	public int getUpdateClub(ClubDTO clubDTO) throws Exception;
	//클럽탈퇴
	public int getDel(int mNo) throws Exception;
	
	
	

	
}
