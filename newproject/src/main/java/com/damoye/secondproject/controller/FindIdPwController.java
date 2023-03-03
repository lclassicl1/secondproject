package com.damoye.secondproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.damoye.secondproject.model.User;
import com.damoye.secondproject.service.UserService;


@Controller
public class FindIdPwController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String requestFindIdForm(@ModelAttribute("user") User user) {
		
		return "user/findIdForm";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String submitFindId(@ModelAttribute("user") User user, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("name") || result.hasFieldErrors("email") || result.hasFieldErrors("phonenum")) {
			model.addAttribute(result.getModel());
			return "user/findIdForm";
		}
		
		try {
			User findId = userService.findId(user.getName(), user.getEmail(), user.getPhonenum());
			model.addAttribute("findId", findId);
			return "user/findIdSuccess";
			
		} catch (EmptyResultDataAccessException e) {
				e.printStackTrace();
			return "user/findIdForm";
		}
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String requestFindPwForm(@ModelAttribute("user") User user) {
		
		return "user/findPwForm";
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public String submitFindPw(@ModelAttribute("user") User user, BindingResult result, Model model) {
		
		if(result.hasFieldErrors("id") || result.hasFieldErrors("name") || result.hasFieldErrors("email")) {
			model.addAttribute(result.getModel());
			return "user/findPwForm";
		}
		try {
			User findPw = userService.findPw(user.getId(), user.getName(), user.getEmail());
			model.addAttribute("findPw", findPw);
			return "user/findPwSuccess";
		}catch(EmptyResultDataAccessException e) {
				e.printStackTrace();
			return "user/findPwForm";
		}
	}
}
