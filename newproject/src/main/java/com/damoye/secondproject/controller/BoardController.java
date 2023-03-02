package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.damoye.secondproject.model.BoardPage;
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
	public String getBoardList(Model model,@RequestParam(name="cNo") int cNo) throws Exception {
			
		List<BoardVO> boardList = boardServiceImpl.getBoardList(cNo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("cNo", cNo);
		return "/board/boardList";
	}
	
	//클럽게시판 글목록+페이징
	//요청주소 ~컨패/board/list?cNo=1
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public String getBoardListPage(Model model,@RequestParam(name="cNo") int cNo, @RequestParam(name="num") int num) throws Exception {
		
		BoardPage boardPage = new BoardPage();
		
		boardPage.setNum(num);
		boardPage.setCount(boardServiceImpl.count(cNo));
		boardPage.setcNo(cNo);

		List<BoardVO> boardList = boardServiceImpl.getBoardListPage(boardPage.getcNo(),boardPage.getDisplayPost(),boardPage.getPostNum());
		//List<BoardVO> boardList = boardServiceImpl.getBoardListPage(cNo, displayPost, postNum);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("cNo", cNo);
		model.addAttribute("boardPage", boardPage);
		model.addAttribute("num", num);
		return "/board/boardListPage";
		
	}
	
	//클럽게시판 글 상세보기+댓글보기
	//요청주소 ~컨패/board/detail?cNo=&boardNo=
	@RequestMapping(value="/board/detail", method=RequestMethod.GET)
	public String boardDetail(Model model, @RequestParam(name="boardNo") int boardNo) throws Exception {
		BoardVO boardVO = boardServiceImpl.getBoardDetail(boardNo);
		model.addAttribute("boardVO", boardVO);
		
		//댓글조회
		List<CommVO> commList = commboardServiceImpl.getcommList(boardNo);
		model.addAttribute("commList", commList);
		
		return "/board/boardDetail";
		
	}

	//클럽게시판 글쓰기
	//입력폼보여주기
	//요청주소 ~컨패/board/boardWrite?cNo=
	@GetMapping("/board/boardWrite")
	public String insertBoardForm(Model model, @RequestParam(name="cNo") int cNo,@RequestParam(name="num") int num,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("userId", "hongid");//임시!!!!!!!!!!!!!!!!!!!!!!!
		model.addAttribute("cNo", cNo);
		model.addAttribute("num", num);
		return "/board/boardWrite";
	}
	
	//입력처리
	@PostMapping("/board/boardWrited")
	public String insertBoard(Model model, @RequestParam(name="cNo") int cNo,@RequestParam(name="num") int num,@ModelAttribute BoardVO boardVO, HttpServletRequest request) throws Exception{
		System.out.println(boardVO);
		boardServiceImpl.insertBoard(boardVO);
		model.addAttribute("cNo", cNo);
		model.addAttribute("num", num);
		return "redirect:/board/list?cNo="+cNo+"&num="+num;
	}
	/*
	//클럽게시판 글삭제(update)
	//요청주소~컨패/article/delete?cNo=&boardNo=
	@PostMapping(value="/board/deleteBoard")
	public ModelAndView deleteBoard(@RequestParam int cNo, @RequestParam int boardNo, ModelAndView mv) throws Exception {
		BoardVO boardVO = new BoardVO();
		boardVO.setcNo(cNo);
		boardVO.setBoardNo(boardNo);
		
		int cnt = boardServiceImpl.deleteBoard(cNo, boardNo, boardVO);
		if(cnt==1) {
			mv.setViewName("redirect:/board/list?cNo="+cNo+"&num=1");
		}else {
			mv.setViewName("redirect:/board/detail");
		}
		return mv;
		
	}*/
	
	//클럽게시판 글수정
	//수정폼
	/*@GetMapping("/board/boardUpdate")
	public String updateBoard(@RequestParam(name="cNo") int cNo,@RequestParam(name="num") int num, @RequestParam(name="boardNo") int boardNo,Model model) throws Exception {
		
		BoardVO boardVO = boardServiceImpl.getBoardDetail(boardNo);
		model.addAttribute("cNo", cNo);
		model.addAttribute("num", num);
		model.addAttribute("boardVO", boardVO);
		return "board/boardUpdate";
	}*/
	
	@GetMapping("/board/boardUpdate")
	public String updateBoard(@RequestParam(name="boardNo") int boardNo,Model model) throws Exception {
		
		BoardVO boardVO = boardServiceImpl.getBoardDetail(boardNo);
		//model.addAttribute("cNo", cNo);
		//model.addAttribute("num", num);
		model.addAttribute("boardVO", boardVO);
		return "board/boardUpdate";
	}

		
	//수정처리
	@PostMapping("/board/boardUpdate")
	public ModelAndView updateSubmitBoard(@RequestParam(name="cNo") int cNo, @RequestParam(name="boardNo") int boardNo,ModelAndView mv) {
		BoardVO boardVO = new BoardVO();
		boardVO.setcNo(cNo);
		boardVO.setBoardNo(boardNo);
		
		int cnt = boardServiceImpl.updateBoard(boardVO);
		if(cnt==1) {
			mv.setViewName("/board/boardListPage");
		}else {
			mv.setViewName("/board/boardUpdate");
		}
		
		return mv;

	}
	
}
