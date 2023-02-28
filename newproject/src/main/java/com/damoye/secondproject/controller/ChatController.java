package com.damoye.secondproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
	@ResponseBody
	public void addPostMessage(@RequestParam int roomNo,@RequestParam String writerId,
								@RequestParam String content) {
		//Map<String, Object> rs = new HashMap<>();
		ChatDTO chatDTO = new ChatDTO();
		chatDTO.setRoomNo(roomNo);
		chatDTO.setWriterId(writerId);
		chatDTO.setContent(content);
		
		System.out.println(roomNo);
		System.out.println(writerId);
		System.out.println(content);
		
		chatService.addMessage(chatDTO);
		
		//rs.put("message","success");
		
		//return rs;
	}
	
	@RequestMapping(value = "/chat/checkMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listMessage(@RequestParam int roomNo) {
		Map<String, Object> rs = new HashMap<>();
		List<ChatDTO> list = chatService.listMessage(roomNo);
		rs.put("message",list);
		return rs;
	}

}
