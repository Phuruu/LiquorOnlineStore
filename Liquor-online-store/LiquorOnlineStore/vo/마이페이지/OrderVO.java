package com.huiloaelag.users.mypage;

import java.util.Date;

public class OrderVO {
	private int oCode;
	private int uCode;
	private int cOucode;
	private int pCode;
	private Date oDate;
	private int oCnt;
	private int oPrice;
	private String oPay;
	private int oNum;
	
	public OrderVO() {
		System.out.println("Order() 객체 생성");
	}

	public int getoCode() {
		return oCode;
	}

	public void setoCode(int oCode) {
		this.oCode = oCode;
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public int getcOucode() {
		return cOucode;
	}

	public void setcOucode(int cOucode) {
		this.cOucode = cOucode;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getoCnt() {
		return oCnt;
	}

	public void setoCnt(int oCnt) {
		this.oCnt = oCnt;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public String getoPay() {
		return oPay;
	}

	public void setoPay(String oPay) {
		this.oPay = oPay;
	}

	public int getoNum() {
		return oNum;
	}

	public void setoNum(int oNum) {
		this.oNum = oNum;
	}

	@Override
	public String toString() {
		return "OrderVO [oCode=" + oCode + ", uCode=" + uCode + ", cOucode=" + cOucode + ", pCode=" + pCode
				+ ", oDate=" + oDate + ", oCnt=" + oCnt + ", oPrice=" + oPrice + ", oPay=" + oPay + ", oNum=" + oNum
				+ "]";
	}
	
	
	
}
