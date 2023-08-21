package com.huiloaelag.users.mypage;

public class UserVO {
	private int uCode;
	private String uSerid;
	private String uSerpwd;
	private String uName;
	private String uNick;
	private String uAddr;
	private int uGender;
	private String uEmail;
	private String uBirth;
	private String uPhone;
	
	public UserVO() {
		System.out.println("User() 객체 생성");
	}

	public int getuCode() {
		return uCode;
	}

	public void setuCode(int uCode) {
		this.uCode = uCode;
	}

	public String getuSerid() {
		return uSerid;
	}

	public void setuSerid(String uSerid) {
		this.uSerid = uSerid;
	}

	public String getuSerpwd() {
		return uSerpwd;
	}

	public void setuSerpwd(String uSerpwd) {
		this.uSerpwd = uSerpwd;
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

	public String getuBirth() {
		return uBirth;
	}

	public void setuBirth(String uBirth) {
		this.uBirth = uBirth;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	@Override
	public String toString() {
		return "UserVO [uCode=" + uCode + ", uSerid=" + uSerid + ", uSerpwd=" + uSerpwd + ", uName=" + uName
				+ ", uNick=" + uNick + ", uAddr=" + uAddr + ", uGender=" + uGender + ", uEmail=" + uEmail + ", uBirth="
				+ uBirth + ", uPhone=" + uPhone + "]";
	}
	
	
}
