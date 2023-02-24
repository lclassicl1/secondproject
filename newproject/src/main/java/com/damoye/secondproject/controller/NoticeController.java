package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damoye.secondproject.model.NoticeDTO;
import com.damoye.secondproject.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeServiceImpl;
	
	//공지사항 전체글 리스트
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String getNoticeList(Model model, HttpServletRequest req) {
		
		//세션
//		HttpSession session = req.getSession();
//		String id = (String) session.getAttribute("id");
//		System.out.println("id값:"+id);
		
		
		List<NoticeDTO> noticeList = noticeServiceImpl.getNoticeList();
		
		model.addAttribute("noticeList",noticeList);
		return "notice/noticeList";
	}
	
	//공지사항 글쓰기 폼 보여주기
	@RequestMapping(value="notice/insert", method=RequestMethod.GET)
	public String insertNoticeForm() {
		
		return "notice/insertForm";
	}
	
	@RequestMapping(value="notice/insert", method=RequestMethod.POST)
	public String insertNotice(NoticeDTO noticeDTO) {
		
		System.out.println("noticeDTO="+noticeDTO.toString());
		int cnt = noticeServiceImpl.noticeInsert(noticeDTO);
		if(cnt == 0) {
			System.out.println("공지사항 글쓰기 실패");
			return null;
		}
		return "redirect:/notice";
	}
	
	//공지사항 특정글 조회 상세보기
	@RequestMapping(value="notice/read", method=RequestMethod.GET)
	public String readNoticeDetail(@RequestParam("no") int no, Model model) {
		NoticeDTO noticeDTO = noticeServiceImpl.getDetailNotice(no);
		model.addAttribute("noticeDTO", noticeDTO);
		return "notice/readNotice";
	}
	
	//공지사항 글 수정 폼 보여주기
	@GetMapping("notice/updateForm")
	public String updateNoticeForm(@RequestParam("no") int no, Model model) {
		NoticeDTO noticeDTO = noticeServiceImpl.getDetailNotice(no);
		model.addAttribute("noticeDTO", noticeDTO);
		return "notice/updateForm";
	}
	
	//공지사항 글 수정 동작
	@PostMapping("notice/updateForm")
	public String updateNotice(NoticeDTO noticeDTO) {
		System.out.println("noticeDTO=="+noticeDTO);
		int cnt = noticeServiceImpl.updateNotice(noticeDTO);
		System.out.println("cnt="+cnt);
		
		if(cnt == 0) {
			System.out.println("수정실패");
			return "notice";
		}
		
		return "redirect:/notice";
	
	}
	
}
