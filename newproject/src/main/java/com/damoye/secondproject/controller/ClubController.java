package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.damoye.secondproject.model.BoardVO;
import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.model.ClubMemberDTO;
import com.damoye.secondproject.service.ClubService;

@Controller
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@Autowired
	private ClubService clubService;
	
	@GetMapping("/club/maintest")
	public String getCheck() {
		return "club/main";
	}	

	//   /club/clist?categoryNo=1
	@GetMapping("/club/clist")
	public ModelAndView getSelClub(int categoryNo, ModelAndView mv,ClubDTO clubDTO) throws Exception {		
		//특정 카테고리명 조회 selCategoryName
		String categoryName=clubService.getSelCategoryName(categoryNo);
		mv.addObject("category", categoryName);

		//검색 기능
		
		//클럽 조회
		List<ClubDTO> clubList = clubService.getSelClubList();
		mv.addObject("clubList", clubList);
		mv.setViewName("club/clubList");		
		return mv;		
	}
	
	//클럽상세보기 
	@GetMapping("/club/detail")
	public String getClubDetail(int cNo, Model model) throws Exception {
		//클럽 소개글-selClubDetail
		ClubDTO clubDTO = clubService.getSelClubDetail(cNo);
		model.addAttribute("clubDTO", clubDTO);
		//클럽 가입자 수 clubCount
		int clubSign=clubService.getClubCount(cNo);
		model.addAttribute("sPeople", clubSign);
		//클럽 모임글 selBoardDetail
		BoardVO boardVO=clubService.getSelBDetail(cNo);
		model.addAttribute("boardVO", boardVO);		
		//클럽가입 아이디 리스트 clubMemeber
		List<ClubMemberDTO> clubMemberDTO=clubService.getSignMember(cNo);
		model.addAttribute("signMember", clubMemberDTO);		
		return "club/clubDetail";
	}

	//클럽 가입하기-폼요청 signClub
	@GetMapping("/club/sign")
	public String getInSignClub(HttpServletRequest request) throws Exception {		
	//	HttpSession session=request.getSession();
	//	session.setAttribute("", );		
		return "club/clubSignForm";		
	}
	//클럽 가입하기-입력요청 signClub
	@PostMapping("/club/sign")
	public String getInSignClubFrm(ClubMemberDTO clubMemberDTO,int categoryNo) throws Exception {
		logger.info(clubMemberDTO.toString());//확인용
		//카테고리명 입력
		String categoryName=clubService.getSelCategoryName(categoryNo);
		//클럽 개설
		clubService.getSignClub(clubMemberDTO);		
		return "redirect:/club/clist";
	}
	
	//클럽 수정하기-폼요청
	@GetMapping("/club/clubUp")
	public String getUpClub(int cNo, Model model) throws Exception {
		//클럽 상세보기
		ClubDTO clubDTO=clubService.getSelClubDetail(cNo);	
		model.addAttribute("clubDTO", clubDTO);
		return "club/clubUpdate";		
	}
	
	//클럽 수정하기-처리요청 updateClub
	@PostMapping("/club/clubUp")
	public ModelAndView getUpdateClubFrm(ModelAndView mv, ClubDTO clubDTO) throws Exception{
		//수정
		int cnt=clubService.getUpdateClub(clubDTO);	
		if(cnt==1) {
			mv.setViewName("redirect:/club/clist");
		}else {
			mv.setViewName("redirect:/club/clubUp?cNo="+clubDTO.getcNo());
		}
		
		return mv;
	}	
	//클럽 생성하기-폼요청
	@GetMapping("/club/clubCre")
	public String getInClub(HttpServletRequest request) throws Exception {
		//	HttpSession session=request.getSession();
		//	session.setAttribute("", );	
		return "club/clubCreate";		
	}
	

	
	
	//클럽 생성하기-처리요청
	@PostMapping("/club/clubCre")
	public String getInClubFrm(ClubDTO clubDTO) throws Exception {
		logger.info(clubDTO.toString()); //확인용
		clubService.getCreClub(clubDTO);
		return "redirect:/club/maintest";	 // main 생성시 변경 필요	redirect:요청주소
	}
	
	//클럽 탈퇴-update
	@GetMapping("/club/clubDel")
	public ModelAndView getDelClub(@RequestParam("cMemberNo") int mNo, ModelAndView mv,ClubDTO clubDTO) throws Exception {
		int cnt=clubService.getDel(mNo);
		if(cnt==1) {
			mv.setViewName("redirect:/club/main");
		}else {
			mv.setViewName("redirect:/club/detail?cNo="+clubDTO.getcNo());
		}		
		return mv;
	}
	

	
	
}
