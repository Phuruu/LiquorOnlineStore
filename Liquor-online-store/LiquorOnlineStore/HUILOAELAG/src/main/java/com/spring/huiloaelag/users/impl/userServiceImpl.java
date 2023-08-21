package com.spring.huiloaelag.users.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.users.userService;
import com.spring.huiloaelag.users.userVO;


@Service("userService")
public class userServiceImpl implements userService {
	@Autowired
	private usersDAO usersDAO;

	@Override
	public void insertUserCheck(userVO vo) {
		usersDAO.insertUserCheck(vo);
	}

	@Override
	public int selectUserId(String userId) {
		int user = usersDAO.selectUserId(userId);
		return user;
	}

	@Override
	public int selectUserNickname(String userNick) {
		int user = usersDAO.selectUserNickname(userNick);
		return user;
	}

	@Override
	public String selectLogin(userVO vo) {
		String result = usersDAO.selectLogin(vo);
		return result;
	}
	
	@Override
	public void selectLogout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}
	
	// 아이디 찾기
	@Override
	public String findId(userVO vo) {
		String result = usersDAO.findId(vo);
		return result ;
	}
	
	//비밀번호 찾기
	@Override
	public String findPwd(userVO vo) {
		String result = usersDAO.findPwd(vo);
		return result ;
	}

	
}
