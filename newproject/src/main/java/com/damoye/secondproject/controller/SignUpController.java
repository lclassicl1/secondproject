package com.damoye.secondproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damoye.secondproject.model.User;
import com.damoye.secondproject.service.UserService;


@Controller
public class SignUpController {

	@Autowired
	private UserService userService;
	
	
	
	// 회원등록 폼 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String requestSignUpForm(@ModelAttribute("user") User user, Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		return "user/signUpForm";
	}
	
	// 회원등록 데이터 처리
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String submitSignUp(@ModelAttribute("user") User user, Model model,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		System.out.println("member!!=" + user);
		userService.signUpUser(user);
		return "user/signInForm";
	}
}
