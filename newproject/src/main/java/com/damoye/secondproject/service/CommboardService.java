package com.damoye.secondproject.service;

import java.util.List;

import com.damoye.secondproject.model.CommVO;

public interface CommboardService {
	
	//댓글목록조회
	public List<CommVO> getcommList(int boardNo) throws Exception;


}
