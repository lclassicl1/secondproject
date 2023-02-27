package com.damoye.secondproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<BoardVO> getBoardList(int cNo){
		List<BoardVO> boardList = sqlSession.selectList("mapper.board.boardList",cNo);
		return boardList;
	}
	
	/*
	@Override
	public int count(int cNo) {
		return sqlSession.selectOne("mapper.board.count",cNo);
	}
	 */
	
	@Override
	public BoardVO getBoardDetail(int boardNo){
		return sqlSession.selectOne("mapper.board.getBoardDetail",boardNo);
	}
	
	
	
}
