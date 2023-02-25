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
	public List<BoardVO> getBoardList() {
		List<BoardVO> boardList = boardDAOImpl.getBoardList();
		return boardList;
	}
}
