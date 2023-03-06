package com.damoye.secondproject.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	public String newPw(@ModelAttribute("user") User user, Model model) throws Exception {
		
		User findpw = userService.newPassword(user, user.getId());
		
		/* 이메일 보내기 */
        String setFrom = "rudals407@naver.com";
        String toMail = "rudals6969@naver.com";
        String title = "소모임 사이트 다모여입니다.";
        String content = 
                "다모여에 방문해주셔서 감사합니다." +
                "<br><br>" + 
                findpw.getName()+"님의 임시 비밀번호는 " + findpw.getPassword() + "입니다." + 
                "<br>" + 
                "해당 임시 비밀번호로 로그인 후 비밀번호 변경을 권장드립니다.";
        
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
	}
}
