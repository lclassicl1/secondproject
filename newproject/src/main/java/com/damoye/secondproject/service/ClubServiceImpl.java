package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.ClubDAO;
import com.damoye.secondproject.dao.ClubDAOImpl;
import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;
import com.damoye.secondproject.model.User;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO clubDAO;

	//특정 카테고리 조회
	@Override
	public String getSelCategoryName(int categoryNo) throws Exception {
		String category =clubDAO.getSelCategoryName(categoryNo);	
		return category;
	}
	//클럽 목록 조회 selClubList
	@Override
	public List<ClubDTO> getSelClubList(int categoryNo)throws Exception{	
		List<ClubDTO> cList= clubDAO.getSelClubList(categoryNo);
		return cList;
	}
	
	//검색
	@Override
	public List<ClubDTO> getSearchCName(ClubDTO clubDTO) throws Exception {
		List<ClubDTO> cNameList=clubDAO.getSearchCName(clubDTO);
		return cNameList;
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
	public List<BoardVO> getSelBDetail(int cNo) throws Exception {
		List<BoardVO> boardList= clubDAO.getSelBDetail(cNo);
		System.out.println("서비스"+boardList);//확인용
		return boardList;		
		
	}
	
	//클럽 가입하기
	@Override
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws Exception {
		clubDAO.getSignClub(clubMemberDTO);
	}
	//클럽 생성
	@Override
	public int getCreClub(ClubDTO clubDTO) throws Exception {
		return clubDAO.getCreClub(clubDTO);		
	}
	//클럽수정
	@Override
	public int getUpdateClub(ClubDTO clubDTO) throws Exception {
		int cnt=clubDAO.getUpdateClub(clubDTO);	
		return cnt;		
	}
	//클럽삭제
	@Override
	public int getDel(int cNo) throws Exception {
		int cnt=clubDAO.getDel(cNo);
		return cnt;
	}
	//클럽회원삭제
	@Override
	public int getMemberDel(int cMemberNo) throws Exception {
		int cnt=clubDAO.getMemberDel(cMemberNo);
		return cnt;
	}







}
