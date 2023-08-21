package com.spring.huiloaelag.review.dao;

import java.util.List;

import com.spring.huiloaelag.review.ReviewVO;

public interface ReviewDAO {
	void insertReview(ReviewVO vo);
	void updateReview(ReviewVO vo);
	void deleteReview(ReviewVO vo);
	ReviewVO getReview(ReviewVO vo);
	List<ReviewVO> getReviewList(String pCode);
}
