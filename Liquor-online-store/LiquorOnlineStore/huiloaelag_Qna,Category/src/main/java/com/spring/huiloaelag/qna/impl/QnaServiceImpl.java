package com.spring.huiloaelag.qna.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.qna.ProductVO;
import com.spring.huiloaelag.qna.QnaService;
import com.spring.huiloaelag.qna.QnaVO;
import com.spring.huiloaelag.qna.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDAO QnaDAO;
	
	public QnaServiceImpl() {
		System.out.println(">> QnaServiceImpl() 객체 생성");
	}

	@Override
	public void insertQna(QnaVO vo) {
		QnaDAO.insertQna(vo);
		
	}

	@Override
	public void updateQna(QnaVO vo) {
		QnaDAO.updateQna(vo);
		
	}

	@Override
	public void deleteQna(QnaVO vo) {
		QnaDAO.deleteQna(vo);
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		return QnaDAO.getQna(vo);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		return QnaDAO.getQnaList(vo);
	}

	//지역별 카테고리!!
	@Override
	public List<ProductVO> getAreaList(ProductVO vo) {
		return QnaDAO.getAreaList(vo);
	}

//	@Override
//	public int getQnaTotalCount() {
//		return QnaDAO.getQnaTotalCount();
//	}
//
//	@Override
//	public List<QnaVO> getQnaList(int begin, int end) {
//		return QnaDAO.getQnaList(begin, end);
//	}
//
//	@Override
//	public List<QnaVO> getQnaList(Map<String, Integer> map) {
//		return QnaDAO.getQnaList(map);
//	}

}
