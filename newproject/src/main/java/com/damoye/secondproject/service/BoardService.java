package com.damoye.secondproject.service;

import java.util.List;

import com.damoye.secondproject.model.BoardVO;

public interface BoardService {
	
	//클럽게시판 글목록조회
	public List<BoardVO> getBoardList();
}
