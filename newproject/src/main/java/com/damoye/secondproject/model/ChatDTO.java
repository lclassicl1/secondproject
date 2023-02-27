package com.damoye.secondproject.model;

import java.util.Date;

public class ChatDTO {

		private int chattingNo;
		private String writerId;
		private String content;
		private int roomNo;
		private Date creDate;
		
		public ChatDTO() {}
		public ChatDTO(int chattingNo, String writerId, String content, int roomNo,Date creDate) {
			this.chattingNo = chattingNo;
			this.writerId = writerId;
			this.content = content;
			this.roomNo = roomNo;
			this.creDate = creDate;
		}
		public int getChattingNo() {
			return chattingNo;
		}
		public String getWriterId() {
			return writerId;
		}
		public String getContent() {
			return content;
		}
		public int getRoomNo() {
			return roomNo;
		}
		public Date getCreDate() {
			return creDate;
		}
		public void setChattingNo(int chattingNo) {
			this.chattingNo = chattingNo;
		}
		public void setWriterId(String writerId) {
			this.writerId = writerId;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public void setRoomNo(int roomNo) {
			this.roomNo = roomNo;
		}
		public void setCreDate(Date creDate) {
			this.creDate = creDate;
		}
		
		
	}
