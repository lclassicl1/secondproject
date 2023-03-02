package com.damoye.secondproject.dao;

import java.util.List;

import com.damoye.secondproject.model.CommVO;

public interface CommboardDAO {

	//댓글조회
	public List<CommVO> list(int boardNo) throws Exception;
}
