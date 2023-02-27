package com.damoye.secondproject.model;

import java.util.Date;

//클럽구성원DTO
public class ClubMemberDTO {
	private int cMemberNo; //클럽에 가입한 회원번호
	private int cNo; //클럽번호
	private int no; //회원번호
	private String memberId; //회원아이디
	private Date joinDate; //클럽 가입일
	public ClubMemberDTO() {}
	public ClubMemberDTO(int cMemberNo, int cNo, int no, String memberId, Date joinDate) {
		this.cMemberNo = cMemberNo;
		this.cNo = cNo;
		this.no = no;
		this.memberId = memberId;
		this.joinDate = joinDate;
	}
	public int getcMemberNo() {
		return cMemberNo;
	}
	public void setcMemberNo(int cMemberNo) {
		this.cMemberNo = cMemberNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "ClubMemberDTO [cMemberNo=" + cMemberNo + ", cNo=" + cNo + ", no=" + no + ", memberId=" + memberId
				+ ", joinDate=" + joinDate + "]";
	}
	
	

}
