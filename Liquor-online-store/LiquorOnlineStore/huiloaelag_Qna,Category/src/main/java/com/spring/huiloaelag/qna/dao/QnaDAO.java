package com.spring.huiloaelag.qna.dao;

import java.util.List;
import java.util.Map;

import com.spring.huiloaelag.qna.ProductVO;
import com.spring.huiloaelag.qna.QnaVO;

public interface QnaDAO {
	void insertQna(QnaVO vo);
	void updateQna(QnaVO vo);
	void deleteQna(QnaVO vo);
	QnaVO getQna(QnaVO vo);
	List<QnaVO> getQnaList(QnaVO vo);
	
	// --------------------
	// 페이징처리
//	int getQnaTotalCount();
//	List<QnaVO> getQnaList(int begin, int end);
//	List<QnaVO> getQnaList(Map<String, Integer> map);
	
	//--------------------
	//지역별 카테고리!!!
	List<ProductVO> getAreaList(ProductVO vo);
}
