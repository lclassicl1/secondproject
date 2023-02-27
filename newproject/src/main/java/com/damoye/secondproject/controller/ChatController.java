package com.damoye.secondproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.damoye.secondproject.model.ChatDTO;
import com.damoye.secondproject.service.ChatService;


@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat/room")
	public String showRoom(int roomNo) {
		return "chat/room";
	}
	@RequestMapping(value="/chat/addMessage", method=RequestMethod.POST)
	//@ResponseBody
	public String addPostMessage(@RequestParam int roomNo,@RequestParam String writerId,
								@RequestParam String content,Model model,HttpServletRequest req) {
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setRoomNo(roomNo);
		chatDTO.setWriterId(writerId);
		chatDTO.setContent(content);
		
		chatService.addMessage(chatDTO);
		model.addAttribute("roomNo", roomNo);
		
		return "redirect:/chat/room";
	}
	
	@RequestMapping(value = "/chat/checkMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listMessage(@RequestParam int roomNo) {
		System.out.println(roomNo);
		System.out.println("controller");
		Map<String, Object> rs = new HashMap<>();
		List<ChatDTO> list = chatService.listMessage(roomNo);
		rs.put("message",list);
		System.out.println("controller2");
		return rs;
	}

}
