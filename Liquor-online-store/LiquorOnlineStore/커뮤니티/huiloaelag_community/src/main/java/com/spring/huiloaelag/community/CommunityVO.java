package com.spring.huiloaelag.community;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "searchCondition", "searchKeyword" })
public class CommunityVO {
	private int mCode;
	private int uCode;
	private String mTitle;
	private String mContent;
	private Date mDate;
	private String mPwd;
	private int mGood;
	
	//--검색조건 처리용
	//@JsonIgnore // JSON 데이터 변경 제외
	private String searchCondition;
	//@JsonIgnore
	private String searchKeyword;
	
	public CommunityVO() {
		System.out.println("Community() 객체 생성");
	}

	public int getmCode() {
		return mCode;
	}

	public void setmCode(int mCode) {
		this.mCode = mCode;
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	
	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public int getmGood() {
		return mGood;
	}

	public void setmGood(int mGood) {
		this.mGood = mGood;
	}

	@Override
	public String toString() {
		return "CommunityVO [mCode=" + mCode + ", uCode=" + uCode + ", mTitle=" + mTitle + ", mContent=" + mContent
				+ ", mDate=" + mDate + ", mPwd=" + mPwd + ", mGood=" + mGood + "]";
	}
	
	//------------------------
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
}
