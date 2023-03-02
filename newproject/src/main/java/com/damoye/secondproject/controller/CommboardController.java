package com.damoye.secondproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.damoye.secondproject.service.CommboardService;

@Controller
public class CommboardController {
	
	@Autowired
	public CommboardService commboardServiceImpl;
	
}
