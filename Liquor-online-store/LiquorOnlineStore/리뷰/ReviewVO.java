package com.spring.huiloaelag.review;

import java.util.Date;

public class ReviewVO {
	int rCode;
	int uCode;
	int pCode;
	int rStar;
	Date rDate;
	String rTitle;
	String rContent;
	
	public int getrCode() {
		return rCode;
	}
	public void setrCode(int rCode) {
		this.rCode = rCode;
	}
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public int getrStar() {
		return rStar;
	}
	public void setrStar(int rStar) {
		this.rStar = rStar;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [rCode=" + rCode + ", uCode=" + uCode + ", pCode=" + pCode + ", rStar=" + rStar + ", rDate="
				+ rDate + ", rTitle=" + rTitle + ", rContent=" + rContent + "]";
	}
	
	
}
