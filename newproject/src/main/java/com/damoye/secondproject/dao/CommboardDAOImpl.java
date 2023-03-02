package com.damoye.secondproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.CommVO;

@Repository
public class CommboardDAOImpl implements CommboardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CommVO> list(int boardNo) throws Exception {
		return sqlSession.selectList("mapper.board.commList", boardNo);
	}

}
