package com.damoye.secondproject.service;

import java.util.List;

import com.damoye.secondproject.model.NoticeDTO;

public interface NoticeService {
	
	//공지사항 게시글 리스트
	public List<NoticeDTO> getNoticeList();
	
	//공지사항 글작성
	public int noticeInsert(NoticeDTO noticeDTO);

	public NoticeDTO getDetailNotice(int no);
	
	//공지사항 글 수정
	public int updateNotice(NoticeDTO noticeDTO);
}
