package com.damoye.secondproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	 @Override
    public List<BoardVO> getBoardList(int cNo) {
        return sqlSession.selectList("boardList", cNo);
    }
	
	 @Override
	 public BoardVO getBoardDetail(int boardNo){
		 return sqlSession.selectOne("mapper.board.getBoardDetail",boardNo);
	 }

	 @Override
	 public void insertBoard(BoardVO boardVO) {
		 int cnt = sqlSession.insert("mapper.board.insertBoard", boardVO);
		 System.out.println("cnt="+cnt);
		 
	 }
	

	 @Override
	 public int count(int cNo) {
		 return sqlSession.selectOne("mapper.board.count", cNo);
	 }

	@Override
	public List<BoardVO> getBoardListPage(int cNo, int displayPost, int postNum) {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("cNo", cNo);
		data.put("displayPost", displayPost);
		data.put("postNum",postNum);
		
		return sqlSession.selectList("boardListPage", data);
	}

	/*
	//클럽게시판 글삭제(update)
	@Override
	public int deleteBoard(int cNo, int boardNo, BoardVO boardVO) {
		int cnt=sqlSession.selectOne("mapper.board.deleteBoard", boardVO);
		System.out.println(cnt);
		return cnt;
	}
*/
	@Override
	public int updateBoard(BoardVO boardVO) {
		int cnt=sqlSession.update("mapper.board.updateBoard", boardVO);
		System.out.println(cnt);
		return cnt;
	}
	

	
	
	
}
