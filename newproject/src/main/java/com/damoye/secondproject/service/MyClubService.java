package com.damoye.secondproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.MyClubDAO;

@Service
public class MyClubService {

	@Autowired
	private MyClubDAO myClubDAO;

	public void getMyClub(int userNo) {
		myClubDAO.getMyClubNo(userNo);
	}
}
