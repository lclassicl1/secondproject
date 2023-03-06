package com.damoye.secondproject.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
	public String SubmitSignIn(@ModelAttribute("user") User user, String id, BindingResult result, Model model, HttpSession session) throws Exception {

		System.out.println("User user="+user);
		if(result.hasFieldErrors("id")||result.hasFieldErrors("password")) {
			//id에서 에러가 나왔을 때 || pass에서 에러가 나왔을 때
			model.addAttribute(result.getModel());
			//에러 메시지를 가진 model을 login에 전달
			return "user/signInForm";
		}
		
		try {
			User loginUser = userService.getMemberById(user.getId());
			System.out.println("loginUser="+loginUser);
			
			if(user.getPassword().equals(loginUser.getPassword())) {
				
				model.addAttribute("loginUser", loginUser);
				
				session.setAttribute("loginUser", loginUser);
				return "user/main";
			}
		else {
			result.rejectValue("password", "error.password.user", "패스워드가 일치하지 않습니다.");
			model.addAllAttributes(result.getModel());
			return "user/signInForm";
		}
	}catch(EmptyResultDataAccessException e) {
		result.rejectValue("id", "error.id.user", "존재하지 않는 아이디입니다.");
		model.addAllAttributes(result.getModel());
		return "user/signInForm";
	}
}
	
	@RequestMapping(value="/loginSuccess", method = RequestMethod.GET)
	public String onSubmitGET(User user, BindingResult result, Model model, HttpSession session) {
		
		String loginUser = (String)session.getAttribute("loginUser");
		model.addAttribute("loginUser", loginUser);
	
		return "/main";
	}
	
	@RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/signIn");
        return mv;
    }
	
}	
