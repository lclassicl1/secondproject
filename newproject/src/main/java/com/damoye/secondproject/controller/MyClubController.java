package com.damoye.secondproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damoye.secondproject.model.ClubDTO;
import com.damoye.secondproject.service.MyClubService;

@Controller
public class MyClubController {

	@Autowired
	private MyClubService myClubService;
	
	@RequestMapping("/myClub")
	public String myClub(HttpSession session,Model model) {
		int userNo = (Integer)session.getAttribute("userNo");
		List<ClubDTO> clubList = myClubService.getMyClub(userNo);
		model.addAttribute("list",clubList);
		
		return "club/myClub";
	}
}
