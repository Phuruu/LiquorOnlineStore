package com.spring.huiloaelag.review;

import java.util.List;


public interface ReviewService {
	void insertReview(ReviewVO vo);
	void updateReview(ReviewVO vo);
	void deleteReview(ReviewVO vo);
	ReviewVO getReview(ReviewVO vo);
	List<ReviewVO> getReviewList(String pCode);
}
