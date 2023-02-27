package com.damoye.secondproject.dao;

import java.util.List;

import com.damoye.secondproject.model.BoardVO;

public interface BoardDAO {
	
	//클럽게시판 글목록
	public List<BoardVO> getBoardList(int cNo);
	
	//클럽게시판 게시글 수
	//public int count(int cNo);
	
	public BoardVO getBoardDetail(int boardNo);
}
