package com.spring.huiloaelag.users;

import javax.servlet.http.HttpSession;


public interface userService {
	void insertUserCheck(userVO vo);
	int selectUserId(String userId);
	int selectUserNickname(String userNickname);
	String selectLogin(userVO vo);
	void selectLogout(HttpSession session);
	String findId(userVO vo);
	String findPwd(userVO vo);
}
