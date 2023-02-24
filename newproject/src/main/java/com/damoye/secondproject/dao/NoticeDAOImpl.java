package com.damoye.secondproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.damoye.secondproject.model.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 게시글 전체 리스트
	@Override
	public List<NoticeDTO> getNoticeList() {
		List<NoticeDTO> noticeList = sqlSession.selectList("mapper.notice.noticeList");
		return noticeList;
	}
	
	//공지사항 글작성
	@Override
	public int noticeInsert(NoticeDTO noticeDTO) {
		return sqlSession.insert("mapper.notice.noticeInsert",noticeDTO);
	}

	@Override
	public NoticeDTO getDetailNotice(int no) {
		return sqlSession.selectOne("mapper.notice.getDetailNotice", no);
	}

	//공지사항 글 수정
	@Override
	public int updateNotice(NoticeDTO noticeDTO) {
		return sqlSession.update("mapper.notice.updateNotice", noticeDTO);
	}

}
