package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.damoye.secondproject.model.NoticeDTO;
import com.damoye.secondproject.model.User;
import com.damoye.secondproject.service.ClubServiceImpl;

@Controller
public class ClubController {
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);

	@Autowired
	private ClubServiceImpl clubService;

	
	@GetMapping("/club/maintest")
	public String getCheck(Model model ) {
		return "club/main";
	}	

	//클럽리스트
	//   /club/clist?categoryNo=1
	@GetMapping("/club/clist")
	public String getSelClub(int categoryNo, Model model,ClubDTO clubDTO,HttpSession session) throws Exception {		
		//특정 카테고리명 조회 selCategoryName
		String cateogryName=clubService.getSelCategoryName(categoryNo);
		//mv.addObject("category", cateogryName);
		model.addAttribute("category", cateogryName);
	
		//클럽 조회
		List<ClubDTO> clubList = clubService.getSelClubList(categoryNo);
		logger.info(clubList.toString());//확인용
		model.addAttribute("clubList", clubList);
		
		return "club/clubList";		
	}
	
	//클럽 검색 /club/searchClist
	@GetMapping("/club/searchCName")
	public ModelAndView searchCName(@RequestParam String searchCName,@RequestParam int categoryNo, ModelAndView mv) throws Exception {		
		ClubDTO clubDTO = new ClubDTO();
		clubDTO.setCategoryNo(categoryNo);
		clubDTO.setcName(searchCName);
		
		List<ClubDTO> clubList = clubService.getSearchCName(clubDTO);
		logger.info(clubList.toString());//확인용
		mv.addObject("clubList", clubList);
		mv.setViewName("club/clubList");
		
		return mv;
	}
	
	
	//클럽상세보기 
	@GetMapping("/club/detail")
	public String getClubDetail(int categoryNo,int cNo, Model model) throws Exception {
		String category=clubService.getSelCategoryName(categoryNo);
		model.addAttribute("category", category);
		//클럽 소개글-selClubDetail
		ClubDTO clubDTO = clubService.getSelClubDetail(cNo);
		model.addAttribute("clubDTO", clubDTO);
		//클럽 가입자 수 clubCount
		int clubSign=clubService.getClubCount(cNo);
		model.addAttribute("sPeople", clubSign);		
		//클럽 모임글 selBoardDetail
		List<BoardVO> boardVO=clubService.getSelBDetail(cNo);
		model.addAttribute("boardVO", boardVO);			
		//클럽가입 아이디 리스트
		List<User> clubMemberDTO=clubService.getSignMember(cNo);
		model.addAttribute("signMember", clubMemberDTO);		
		return "club/clubDetail";
	}
	
	//클럽 가입하기-signClub
	@GetMapping("/club/sign")
	public String getInSignClub(HttpServletRequest request, @RequestParam int cNo,ClubMemberDTO clubMemberDTO, Model model, int categoryNo) throws Exception {
		ClubDTO clubDTO = new ClubDTO();
		clubDTO.setcNo(cNo);
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("loginUser");
		model.addAttribute("cNo", cNo);
		model.addAttribute("loginUser",user);
		//-------------------------------------
		clubDTO.setCategoryNo(categoryNo);
		model.addAttribute("categoryNo", categoryNo);
		return "club/clubSignForm";		
	}
	@PostMapping("/club/sign")
	public String getInSignClubFrm(ClubMemberDTO clubMemberDTO,@RequestParam int cNo, Model model, int categoryNo) throws Exception {
		ClubDTO club = new ClubDTO();
		System.out.println("클럽DTO : "+club);
		club.setcNo(cNo);
		model.addAttribute("cNo", cNo);
		clubService.getSignClub(clubMemberDTO);	
		//---------------
		String category=clubService.getSelCategoryName(categoryNo);
		model.addAttribute("category", category);
		//클럽 소개글-selClubDetail
		ClubDTO clubDTO = clubService.getSelClubDetail(cNo);
		model.addAttribute("clubDTO", clubDTO);
		//클럽 가입자 수 clubCount
		int clubSign=clubService.getClubCount(cNo);
		model.addAttribute("sPeople", clubSign);		
		//클럽 모임글 selBoardDetail
		List<BoardVO> boardVO=clubService.getSelBDetail(cNo);
		model.addAttribute("boardVO", boardVO);			
		//클럽가입 아이디 리스트
		List<User> cMemberDTO=clubService.getSignMember(cNo);
		model.addAttribute("signMember", cMemberDTO);
		
		return "club/clubDetail";			
	}
	//클럽 생성하기-폼요청
	@GetMapping("/club/clubCre")
	public String getInClub(HttpServletRequest request, Model model) throws Exception {
		ClubDTO clubDTO = new ClubDTO();
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("loginUser");
		model.addAttribute("loginUser",user);
		
		return "club/clubCreate";		
	}	
	//클럽 생성하기-처리요청
	@PostMapping("/club/clubCre")
	public ModelAndView getInClubFrm(ClubDTO clubDTO, ModelAndView mv) throws Exception {		
		logger.info(clubDTO.toString()); //확인용
		int cnt=clubService.getCreClub(clubDTO);
		if(cnt==1) {
			mv.setViewName("club/main");
		}else {
			return null;
		}
		return mv;	 // main 생성시 변경 필요
	}
	
	//클럽 수정하기-폼요청
	@GetMapping("/club/clubUp")
	public String getUpClub(@RequestParam("cNo") int cNo, Model model,HttpServletRequest request) throws Exception {
		//클럽 상세보기
		ClubDTO clubDTO=clubService.getSelClubDetail(cNo);	
		clubDTO.setcNo(cNo);
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("loginUser");
		model.addAttribute("cNo", cNo);
		model.addAttribute("loginUser",user);
		model.addAttribute("clubDTO", clubDTO);
		return "club/clubUpdate";		
	}
	
	//클럽 수정하기-처리요청 updateClub
	@PostMapping("/club/clubUp")
	public ModelAndView getUpdateClubFrm(ModelAndView mv, ClubDTO clubDTO) throws Exception{
		//수정
		int cnt=clubService.getUpdateClub(clubDTO);	
		if(cnt==1) {
			mv.setViewName("club/main");
		}else {
			mv.setViewName("forward:/club/clubUp?cNo="+clubDTO.getcNo());
		}
		
		return mv;
	}
	//----------------------------------------------------------------------------------------
	//클럽 탈퇴-update selClubMember
	@GetMapping("/club/clubUpDel")
	public String delUp( HttpServletRequest request,@RequestParam("cMemberNo") int cMemberNo, Model model) throws Exception {
		ClubMemberDTO clubMemberDTO = clubService.selClubMember(cMemberNo);	
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("loginUser");
		model.addAttribute("loginUser",user);
		model.addAttribute("clubMemberDTO", clubMemberDTO);	
		return ("club/clubLeave");
	}
	
	@PostMapping("/club/clubUpDel")
	public ModelAndView delUpClub(ModelAndView mv,ClubMemberDTO clubMemberDTO,ClubDTO clubDTO) throws Exception {
		int cnt=clubService.getUpDel(clubMemberDTO);
		mv.addObject("clubMemberDTO", clubMemberDTO);
		if(cnt==1) {
			mv.setViewName("club/main");
		}else {
			mv.setViewName("forward:/club/detail?cNo="+clubDTO.getcNo());
		}		
		return mv;
	}
	
	//클럽삭제-clubDel
	@GetMapping("/club/clubADel")
	public ModelAndView getDelClub(int cNo,HttpServletRequest request,ModelAndView mv,ClubDTO clubDTO) throws Exception {
		
		int cnt=clubService.getDel(cNo);
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("loginUser");
		mv.addObject("loginUser",user);
		if(cnt==1) {
			mv.setViewName("club/clubLeave");
		}else {
			mv.setViewName("redirect:/club/detail?cNo="+clubDTO.getcNo()+clubDTO.getCategoryNo());
		}		
		return mv;
		
	}
	

	
	
}
