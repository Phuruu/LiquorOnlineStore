package com.spring.huiloaelag.notify.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.huiloaelag.notify.NotifyVO;



@Repository
public class NotifyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<NotifyVO> NotifyList(NotifyVO vo) {
		return mybatis.selectList("notifyDAO.NotifyList", vo);
	}
}
