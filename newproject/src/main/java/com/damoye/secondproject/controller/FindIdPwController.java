package com.damoye.secondproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damoye.secondproject.InvalidEmailException;
import com.damoye.secondproject.InvalidIdException;
import com.damoye.secondproject.InvalidNameException;
import com.damoye.secondproject.MemberNotFoundException;
import com.damoye.secondproject.model.User;
import com.damoye.secondproject.service.UserService;


@Controller
public class FindIdPwController {
	
	@Autowired
    private JavaMailSender mailSender;
	
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
	public String newPw(@ModelAttribute("user") User user, Model model, HttpServletRequest request) throws Exception {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean> ();
		request.setAttribute("errors", errors);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		if(id==null || id.isEmpty()) {
			errors.put("id", Boolean.TRUE);
		}
		if(name==null || name.isEmpty()) {
			errors.put("name", Boolean.TRUE);
		}
		if(email==null || email.isEmpty()) {
			errors.put("email", Boolean.TRUE);
		}
		if(!(id==user.getId())||!(name==user.getName())||!(email==user.getEmail())) {
			errors.put("notMatch", Boolean.TRUE);
		}
		if(!errors.isEmpty()) {
			return "user/findPwForm";
		}
		try {
			User findpw = userService.newPassword(user, user.getId(), user.getName(), user.getEmail());
			
			/* ????????? ????????? */
	        String setFrom = "rudals407@naver.com";
	        String toMail = "rudals6969@naver.com";
	        String title = "????????? ????????? ??????????????????.";
	        String content = 
	                "???????????? ?????????????????? ???????????????." +
	                "<br><br>" + 
	                findpw.getName()+"?????? ?????? ??????????????? " + findpw.getPassword() + "?????????." + 
	                "<br>" + 
	                "?????? ?????? ??????????????? ????????? ??? ???????????? ????????? ??????????????????.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			model.addAttribute("findpw", findpw);		
	        return "user/findPwSuccess";
	        
		}catch(InvalidIdException e) {
			errors.put("id", Boolean.TRUE);
			return "user/findPwForm";
		}catch(InvalidNameException e) {
			errors.put("name", Boolean.TRUE);
			return "user/findPwForm";
		}catch(InvalidEmailException e) {
			errors.put("email", Boolean.TRUE);
			return "user/findPwForm";
		}catch(MemberNotFoundException e) {
			errors.put("notMatch", Boolean.TRUE);
			return "user/findPwForm";
		}
		
	}
	
}
