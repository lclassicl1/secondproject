package com.damoye.secondproject.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damoye.secondproject.model.Criteria;
import com.damoye.secondproject.model.NoticeDTO;
import com.damoye.secondproject.model.NoticePaging;
import com.damoye.secondproject.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeServiceImpl;
	
	@Autowired
	Criteria cri;
	
	@Autowired
	NoticePaging noticePaging;
	/*
	 * @Autowired NoticePaging noticePaging;
	 */
	
	//공지사항 전체글 리스트
	@RequestMapping(value="notice", method=RequestMethod.GET)
	public String getNoticeList(Model model, HttpServletRequest req, Criteria cri) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		//세션
//		HttpSession session = req.getSession();
//		String id = (String) session.getAttribute("id");
//		System.out.println("id값:"+id);
		
		List<NoticeDTO> noticeList = noticeServiceImpl.getNoticeList(cri);
		int total = noticeServiceImpl.selectAllCount();
		
		noticePaging = new NoticePaging(cri, total);
		System.out.println(noticePaging+"개"+total);
		model.addAttribute("paging",noticePaging);
		model.addAttribute("text/html; charset=UTF-8");
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
	
	//공지사항 특정글 조회 상세보기 및 조회수 증가
	@RequestMapping(value="notice/read", method=RequestMethod.GET)
	public String readNoticeDetail(@RequestParam("no") int no, Model model) {
		//조회수 증가
		int cnt = noticeServiceImpl.updateReadCount(no);
		
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
	
	//공지사항 글 삭제
	@GetMapping("notice/delete")
	public String deleteNotice(@RequestParam("no") int no) {
		int cnt = noticeServiceImpl.deleteNotice(no);
		if(cnt == 0) {
			return "notice/deleteFail";
		}
		return "redirect:/notice";
	}
	
	//공지사항 페이지 Ajax
	@GetMapping("notice/paging")
	@ResponseBody
	public void noticePaging(@RequestBody String filterJson, HttpServletResponse res, Model model) throws IOException {
		
		
		int allcount = noticeServiceImpl.selectAllCount();
		System.out.println("전체게시글수:"+allcount);
	}
	
}
