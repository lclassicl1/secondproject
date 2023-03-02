package com.damoye.secondproject.model;

import java.util.List;

public class NoticePaging {
	private int total;
	private int currentPage;
	private List<NoticeDTO> content;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public NoticePaging() {
		
	}

	public NoticePaging(int total, int currentPage, int size, List<NoticeDTO> content,
			int endPage) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		//전체 게시글수가 없다면 전체페이지 0, 시작페이지0, 끝페이지0 으로 설정
		if(total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else { //0이 아니라면 게시글이 있다는것
			this.totalPages = total / size;
			
			if(total % size > 0) {
				this.totalPages++;
			}
			
			int modVal = currentPage%5;
			
			this.startPage = currentPage/5*5+1;
			
			if(modVal == 0) {
				startPage -= 5;
			}
			
			endPage = startPage + 4;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
		
		
	}
	
	public boolean hasNoArticles() {
		return this.total == 0;
	}
	
	public boolean hasArticles() {
		return this.total > 0;
	}

	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<NoticeDTO> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
}
