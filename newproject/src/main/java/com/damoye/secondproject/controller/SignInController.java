package com.damoye.secondproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.damoye.secondproject.model.User;
import com.damoye.secondproject.service.UserService;



@Controller
public class SignInController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/signIn", method=RequestMethod.GET)
	public String requestSignIn(@ModelAttribute("user") User user, BindingResult result, Model model) {
		
		return "user/signInForm";
	}
	
	@RequestMapping(value="/signIn", method =  RequestMethod.POST)
	public String SubmitSignIn(@ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {

		System.out.println("User user="+user);
		if(result.hasFieldErrors("id")||result.hasFieldErrors("password")) {
			model.addAttribute(result.getModel());
			//에러 메시지를 가진 model을 login에 전달
			return "user/signInForm";
		}
		
		try {
			User loginUser = userService.getMemberById(user.getId());
			System.out.println("loginUser="+loginUser);
			
			if(user.getPassword().equals(loginUser.getPassword())) {
				model.addAttribute("loginUser", loginUser);
				
				session.setAttribute("userId", loginUser.getId());
				session.setAttribute("userName", loginUser.getName());
				
				
				session.setAttribute("userNo", loginUser.getNo());
				
				
				return "user/main";
			}
		else {
			result.rejectValue("password", "error.password.user", "패스워드 불일치!");
			model.addAllAttributes(result.getModel());
			return "user/signInForm";
		}
	}catch(EmptyResultDataAccessException e) {
		result.rejectValue("id", "error.id.user", "아이디 불일치!");
		model.addAllAttributes(result.getModel());
		return "user/signInForm";
	}
}
	
	@RequestMapping(value="/loginSuccess", method = RequestMethod.GET)
	public String onSubmitGET(User user, BindingResult result, Model model, HttpSession session) {
		
		String userid = (String)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		model.addAttribute("userId", userid);
		model.addAttribute("userName", userName);
	
		return "/main";
	}
	
	@RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/signIn");
        return mv;
    }
	
}	
