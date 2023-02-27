package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.BoardDAO;
import com.damoye.secondproject.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAOImpl;

	@Override
	public List<BoardVO> getBoardList(int cNo) {
		List<BoardVO> boardList = boardDAOImpl.getBoardList(cNo);
		return boardList;
	}

	@Override
	public BoardVO getBoardDetail(int boardNo) {
		return boardDAOImpl.getBoardDetail(boardNo);
	}
	
	/*
	@Override
	public int count(int cNo) {
		return boardDAOImpl.count(cNo);
	}
	*/
	
}
