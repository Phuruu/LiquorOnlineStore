package com.spring.huiloaelag.users;

public class UserVO {
	private int uCode;
	private String userId;
	private String userPwd;
	private String uName;
	private String uNick;
	private String uAddr;
	private int uGender;
	private String uEmail;
	private int uBirth1;
	private int uBirth2;
	private int uBirth3;
	private String uPhone;
	
	public int getuCode() {
		return uCode;
	}
	public void setuCode(int uCode) {
		this.uCode = uCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getuAddr() {
		return uAddr;
	}
	public void setuAddr(String uAddr) {
		this.uAddr = uAddr;
	}
	public int getuGender() {
		return uGender;
	}
	public void setuGender(int uGender) {
		this.uGender = uGender;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public int getuBirth1() {
		return uBirth1;
	}
	public void setuBirth1(int uBirth1) {
		this.uBirth1 = uBirth1;
	}
	public int getuBirth2() {
		return uBirth2;
	}
	public void setuBirth2(int uBirth2) {
		this.uBirth2 = uBirth2;
	}
	public int getuBirth3() {
		return uBirth3;
	}
	public void setuBirth3(int uBirth3) {
		this.uBirth3 = uBirth3;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	
	@Override
	public String toString() {
		return "UserVO [uCode=" + uCode + ", userId=" + userId + ", userPwd=" + userPwd + ", uName=" + uName
				+ ", uNick=" + uNick + ", uAddr=" + uAddr + ", uGender=" + uGender + ", uEmail=" + uEmail + ", uBirth1="
				+ uBirth1 + ", uBirth2=" + uBirth2 + ", uBirth3=" + uBirth3 + ", uPhone=" + uPhone + "]";
	}
	
	
	

}
