package com.huiloaelag.users.mypage;

import java.sql.Date;

public class QnaVO {
	private int qCode;
	private int uCode;
	private String qTitle;
	private String qContent;
	private String qPwd;
	private Date qDate;
	private String qComment;
	
	private String searchCondition;
	private String searchKeyword;
	
	public QnaVO() {
		System.out.println(">> QnaVO() 객체 생성");
	}
	
	public int getqCode() {
		return qCode;
	}
	public void setqCode(int qCode) {
		this.qCode = qCode;
	}
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getqPwd() {
		return qPwd;
	}
	public void setqPwd(String qPwd) {
		this.qPwd = qPwd;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getqComment() {
		return qComment;
	}
	public void setqComment(String qComment) {
		this.qComment = qComment;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qCode=" + qCode + ", uCode=" + uCode + ", qTitle=" + qTitle + ", qContent=" + qContent
				+ ", qPwd=" + qPwd + ", qDate=" + qDate + ", qComment=" + qComment + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	
}
