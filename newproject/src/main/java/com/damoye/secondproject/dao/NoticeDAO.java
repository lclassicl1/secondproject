package com.damoye.secondproject.dao;

import java.util.List;

import com.damoye.secondproject.model.NoticeDTO;

public interface NoticeDAO {
	
	//mybatis 연동 테스트
	public List<NoticeDTO> getNoticeList();
	
	//공지사항 글작성
	public int noticeInsert(NoticeDTO noticeDTO);
	
	//공지사항 해당 글 상세보기
	public NoticeDTO getDetailNotice(int no);

	//공지사항 글 수정
	public int updateNotice(NoticeDTO noticeDTO);
}
