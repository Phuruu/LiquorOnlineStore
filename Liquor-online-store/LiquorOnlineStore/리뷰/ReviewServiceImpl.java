package com.spring.huiloaelag.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.review.ReviewService;
import com.spring.huiloaelag.review.ReviewVO;
import com.spring.huiloaelag.review.dao.ReviewDAO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	public ReviewServiceImpl() {
		System.out.println(">> ReviewServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
	
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}
	
	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}
	
	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(String pCode) {
		return reviewDAO.getReviewList(pCode);
	}
}
