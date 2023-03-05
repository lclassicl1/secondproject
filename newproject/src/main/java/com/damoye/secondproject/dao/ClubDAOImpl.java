package com.damoye.secondproject.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.CategoryDTO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;
import com.damoye.secondproject.model.User;


@Repository
public class ClubDAOImpl implements ClubDAO {
	//필드
	@Autowired
	private SqlSession sqlSession;


	//특정 카테고리 조회
	@Override
	public String getSelCategoryName(int categoryNo) throws DataAccessException{
		String category= sqlSession.selectOne("mapper.club.selCategoryName",categoryNo);
		return category;
	}

	//클럽 목록 조회 selClubList
	@Override
	public List<ClubDTO> getSelClubList(int categoryNo) throws DataAccessException{
		List<ClubDTO> cList=sqlSession.selectList("mapper.club.selClubList",categoryNo);
		return cList;
	}
	
	//검색
	@Override
	public List<ClubDTO> getSearchCName(ClubDTO clubDTO) throws DataAccessException {
		List<ClubDTO> list = sqlSession.selectList("mapper.club.searchClub", clubDTO);
		return list;
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
	public List<BoardVO> getSelBDetail(int cNo) throws DataAccessException {
		List<BoardVO> boardList = sqlSession.selectList("mapper.club.selBoardDetail", cNo);
		System.out.println("DAO"+boardList);//확인용
		return boardList;
	}
	
	//클럽 상세보기-클럽가입 아이디 리스트
	@Override
	public List<User> getSignMember(int cNo) throws DataAccessException {
		List<User> memberList=sqlSession.selectList("mapper.club.clubMemeber", cNo);
		return memberList;
	}
	//클럽 가입하기
	@Override
	public void getSignClub(ClubMemberDTO clubMemberDTO) throws DataAccessException {
		sqlSession.insert("mapper.club.signClub", clubMemberDTO);
	}
	//클럽 생성
	@Override
	public int getCreClub(ClubDTO clubDTO) throws DataAccessException{
		return sqlSession.insert("mapper.club.createClub", clubDTO);
	}
	//클럽수정 updateClub
	@Override
	public int getUpdateClub(ClubDTO clubDTO) throws DataAccessException {
		int cnt=sqlSession.update("mapper.club.updateClub", clubDTO);
		System.out.println("수정성공시1"+cnt);
		return cnt;		
	}
	
	//클럽삭제
	@Override
	public int getDel(int cNo) throws DataAccessException {
		int cnt=sqlSession.delete("mapper.club.clubAdminDel", cNo);
		System.out.println("DAO"+cnt);
		return cnt;
	}

	//클럽에 가입한 회원멤버 조회
	@Override
	public List<ClubMemberDTO> signClubMeberList(int cNo) throws DataAccessException {
		List<ClubMemberDTO> CMList=sqlSession.selectList("mapper.club.AllClubMemberList",cNo);
		return CMList;
	}

	//클럽 멤버 삭제
	@Override
	public int getMemberDel(int cMemberNo) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.club.clubDelMember", cMemberNo);
		return cnt;
	}



	
}
