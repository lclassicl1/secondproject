package com.damoye.secondproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.CommVO;
import com.damoye.secondproject.service.BoardService;
import com.damoye.secondproject.service.CommboardService;

@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardServiceImpl;
	
	@Autowired
	public CommboardService commboardServiceImpl;

	//클럽게시판 글목록
	//요청주소 ~컨패/board?cNo=1
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String getBoardList(Model model,@RequestParam(name="cNo") int cNo) {
		
		List<BoardVO> boardList = boardServiceImpl.getBoardList(cNo);
		model.addAttribute("boardList", boardList);
		return "/board/boardList";
	}
	//클럽게시판 글 상세보기+댓글보기
	//요청주소 ~컨패/board?cNo=&boardNo=
	@RequestMapping(value="/board/detail", method=RequestMethod.GET)
	public String boardDetail(Model model, @RequestParam(name="boardNo") int boardNo) throws Exception {
		BoardVO boardVO = boardServiceImpl.getBoardDetail(boardNo);
		model.addAttribute("boardVO", boardVO);
		
		//댓글조회
		List<CommVO> commList = commboardServiceImpl.getcommList(boardNo);
		model.addAttribute("commList", commList);
		
		return "/board/boardDetail";
		
	}
	
		

}
