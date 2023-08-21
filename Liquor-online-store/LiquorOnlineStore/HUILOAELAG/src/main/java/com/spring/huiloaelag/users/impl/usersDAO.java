package com.spring.huiloaelag.users.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.huiloaelag.users.userVO;


@Repository
public class usersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUserCheck(userVO vo) {
		mybatis.insert("usersDAO.insertUserCheck", vo);
	}
	
	public int selectUserId(String userId) {
		int user = mybatis.selectOne("usersDAO.selectUserId", userId);
		return user;
	}
	
	public int selectUserNickname(String unick) {
		int user = mybatis.selectOne("usersDAO.selectUserNickname", unick);
		return user;
	}
	
	public String selectLogin(userVO vo) {
		String result = mybatis.selectOne("usersDAO.selectLogin", vo);
		return result;
	}
	
	public String findId(userVO vo) {
		String result = mybatis.selectOne("usersDAO.findId", vo);
		return result;
	}
	
	public String findPwd(userVO vo) {
		String result = mybatis.selectOne("usersDAO.findPwd", vo);
		return result;
	}
	
}
