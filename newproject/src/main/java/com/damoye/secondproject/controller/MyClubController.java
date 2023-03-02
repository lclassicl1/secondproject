package com.damoye.secondproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.damoye.secondproject.service.MyClubService;

@Controller
public class MyClubController {

	@Autowired
	private MyClubService myClubService;
	
	@RequestMapping("/myClub")
	public String myClub(HttpSession session) {
		int userNo = (int)session.getAttribute("userNo");
		myClubService.getMyClub(userNo);
		
		return "";
	}
}
