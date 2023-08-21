package com.huiloaelag.users.mypage;

public class ProductVO {
	private int pCode;
	private String pName;
	private int pPrice;
	private String pInfo;
	private String pImg;
	private String pDetailimg;
	private String pCtyimg;
	private int pSweet;
	private int pSour;
	private int pBody;
	private String pLocal;
	
	//--검색조건 처리용
	private String searchKeyword;
	
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpDetailimg() {
		return pDetailimg;
	}
	public void setpDetailimg(String pDetailimg) {
		this.pDetailimg = pDetailimg;
	}
	public String getpCtyimg() {
		return pCtyimg;
	}
	public void setpCtyimg(String pCtyimg) {
		this.pCtyimg = pCtyimg;
	}
	public int getpSweet() {
		return pSweet;
	}
	public void setpSweet(int pSweet) {
		this.pSweet = pSweet;
	}
	public int getpSour() {
		return pSour;
	}
	public void setpSour(int pSour) {
		this.pSour = pSour;
	}
	public int getpBody() {
		return pBody;
	}
	public void setpBody(int pBody) {
		this.pBody = pBody;
	}
	public String getpLocal() {
		return pLocal;
	}
	public void setpLocal(String pLocal) {
		this.pLocal = pLocal;
	}
	// --------------------------------------------------
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "SearchVO [pCode=" + pCode + ", pName=" + pName + ", pPrice=" + pPrice + ", pInfo=" + pInfo + ", pImg="
				+ pImg + ", pDetailimg=" + pDetailimg + ", pCtyimg=" + pCtyimg + ", pSweet=" + pSweet + ", pSour="
				+ pSour + ", pBody=" + pBody + ", pLocal=" + pLocal 
				+ ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
}

