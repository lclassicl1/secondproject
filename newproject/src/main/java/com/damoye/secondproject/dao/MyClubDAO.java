package com.damoye.secondproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyClubDAO {

	@Autowired
	private SqlSession sqlSession;

	public int getMyClubNo(int userId) {
		return (int)sqlSession.selectOne("mapper.myClub.getMyClubNo", userId);
	}
	
}
