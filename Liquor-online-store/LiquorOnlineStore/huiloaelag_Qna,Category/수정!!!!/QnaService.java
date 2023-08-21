package com.spring.huiloaelag.qna;

import java.util.List;

import com.spring.huiloaelag.admin.ProductVO;

public interface QnaService {
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
	List<ProductVO> getAreaList(String pLocal);
}
