package com.damoye.secondproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.damoye.secondproject.dao.CommboardDAO;
import com.damoye.secondproject.model.CommVO;

@Service
public class CommboardServiceImpl implements CommboardService {
	
	@Autowired
	CommboardDAO commboardDAOImpl;
	
	@Override
	public List<CommVO> getcommList(int boardNo) throws Exception {
		List<CommVO> commList = commboardDAOImpl.list(boardNo);
		return commList;
	}

}
