package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	public BoardService boardServiceImpl;
	
	//클럽게시판 글목록
	//요청주소 ~컨패/board?cNo=1
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String getBoardList(Model model, HttpServletRequest req) {
		
		List<BoardVO> boardList = boardServiceImpl.getBoardList();
		model.addAttribute("boardList", boardList);
		return "/board/boardList";
	}
}
