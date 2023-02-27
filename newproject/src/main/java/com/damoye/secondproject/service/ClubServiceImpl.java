package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.ClubDAO;
import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;

	//카테고리 조회 selCategory
	/*
	 * public List<CategoryDTO> getSelCategory(){ List<CategoryDTO> cgategory=
	 * clubDAO.getSelCategory(); return cgategory; }
	 */
	//특정 카테고리명 조회
	@Override
	public String getSelCategoryName(int categoryNo) throws Exception {
		return (String)clubDAO.getSelCategoryName(categoryNo);		
	}
	//클럽 목록 검색+조회 selClubList
	@Override
	public List<ClubDTO> getSelClubList()throws Exception{	
		return clubDAO.getSelClubList();
	}
	//클럽 상세보기-소개글
	@Override
	public ClubDTO getSelClubDetail(int cNo)throws Exception{
		return clubDAO.getSelClubDetail(cNo);
	}
	
	//클럽 상세보기-가입자수
	@Override
	public int getClubCount(int cNo) throws Exception {
		return clubDAO.getClubCount(cNo);
	}
	//클럽 상세보기-가입리스트
	@Override
	public List<ClubMemberDTO> getSignMember(int cNo) throws Exception {
		List<ClubMemberDTO> memberList =clubDAO.getSignMember(cNo);
		return memberList;
	}
	//클럽 상세보기-모임글
	@Override
	public BoardVO getSelBDetail(int cNo) throws Exception {
		return clubDAO.getSelBDetail(cNo);
		
	}
	
	//클럽 가입하기
	@Override
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws Exception {
		clubDAO.getSignClub(clubMemberDTO);
	}
	//클럽 생성
	@Override
	public void getCreClub(ClubDTO clubDTO) throws Exception {
		clubDAO.getCreClub(clubDTO);		
	}
	//클럽수정
	@Override
	public int getUpdateClub(ClubDTO clubDTO) throws Exception {
		int cnt=clubDAO.getUpdateClub(clubDTO);
		return cnt;
		
	}
	//클럽탈퇴
	@Override
	public int getDel(int mNo) throws Exception {
		int cnt=clubDAO.getDel(mNo);
		return cnt;
		
	}



}
