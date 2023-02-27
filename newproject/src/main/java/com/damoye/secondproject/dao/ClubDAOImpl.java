package com.damoye.secondproject.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;


@Repository
public class ClubDAOImpl implements ClubDAO {
	//필드
	@Autowired
	private SqlSession sqlSession;


	//카테고리 조회 selCategory
	/*
	 * public List<CategoryDTO> getSelCategory(){ return
	 * sqlSession.selectOne("mapper.club.selCategory"); }
	 */
	//특정 카테고리명 조회
	@Override
	public String getSelCategoryName(int categoryNo) throws DataAccessException{
		return (String)sqlSession.selectOne("mapper.club.selCategoryName", categoryNo);
	}

	//클럽 목록 검색+조회 selClubList
	@Override
	public List<ClubDTO> getSelClubList() throws DataAccessException{
		List<ClubDTO> cList=sqlSession.selectList("mapper.club.selClubList");
		return cList;
	}

	//클럽 상세보기-소개글
	@Override
	public ClubDTO getSelClubDetail(int cNo)throws DataAccessException{
		return (ClubDTO)sqlSession.selectOne("mapper.club.selClubDetail", cNo);
	}
	//클럽 상세보기-가입자수
	@Override
	public int getClubCount(int cNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.clubCount", cNo);
	}
	//클럽 상세보기-모임글
	@Override
	public BoardVO getSelBDetail(int cNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.club.selBoardDetail", cNo);
	}
	
	//클럽 상세보기-클럽가입 아이디 리스트
	@Override
	public List<ClubMemberDTO> getSignMember(int cNo) throws DataAccessException {
		List<ClubMemberDTO> memberList=sqlSession.selectList("mapper.club.clubMemeber", cNo);
		return memberList;
	}
	//클럽 가입하기
	@Override
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws DataAccessException {
		sqlSession.insert("mapper.club.signClub", clubMemberDTO);
	}
	//클럽 생성
	@Override
	public void getCreClub(ClubDTO clubDTO) throws DataAccessException{
		sqlSession.insert("mapper.club.createClub", clubDTO);
	}
	//클럽수정 updateClub
	@Override
	public int getUpdateClub(ClubDTO clubDTO) throws DataAccessException {
		int cnt=sqlSession.update("mapper.club.updateClub", clubDTO);
		System.out.println("수정성공시1"+cnt);
		return cnt;
		
	}

	//클럽탈퇴 deleteClub
	@Override
	public int getDel(int mNo) throws DataAccessException {
		int cnt=sqlSession.update("mapper.club.deleteClub", mNo);
		return cnt;
	}


	
	
}
