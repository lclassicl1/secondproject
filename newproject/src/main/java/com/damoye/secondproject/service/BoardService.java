package com.damoye.secondproject.service;

import java.util.List;

import com.damoye.secondproject.model.BoardVO;

public interface BoardService {
	
	//클럽게시판 글목록조회
	public List<BoardVO> getBoardList(int cNo);

	public BoardVO getBoardDetail(int boardNo);
	
	//클럽게시판 게시글 수
	//public int count(int cNo);
}
