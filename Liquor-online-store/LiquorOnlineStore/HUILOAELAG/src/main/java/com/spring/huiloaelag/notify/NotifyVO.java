package com.spring.huiloaelag.notify;

import java.sql.Date;

public class NotifyVO {

	private int nCode;
	private int uCode;
	private String nTitle;
	private String nContent;
	private Date nDate;
	
	public int getnCode() {
		return nCode;
	}
	public void setnCode(int nCode) {
		this.nCode = nCode;
	}
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	
	@Override
	public String toString() {
		return "NotifyVO [nCode=" + nCode + ", uCode=" + uCode + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", nDate=" + nDate + "]";
	}
	
	
}