package com.spring.huiloaelag.view;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.huiloaelag.community.CommentsVO;
import com.spring.huiloaelag.community.CommunityVO;
import com.spring.huiloaelag.review.ReviewService;
import com.spring.huiloaelag.review.ReviewVO;

@Controller
public class ReviewController {
	private ReviewService reviewService;
	
	public ReviewController() {
		System.out.println("==========> ReviewController() 객체 생성");
	}
	
	@Autowired
	public ReviewController(ReviewService reviewService) {
		System.out.println("==========> ReviewService(reviewService) 객체 생성");
		this.reviewService = reviewService;
	}
	
	@RequestMapping("/getReview.do")
	public String getReview(ReviewVO vo, Model model) {
		System.out.println(">>> 리뷰 한개 보기");
		System.out.println("vo : " + vo);
		
		ReviewVO review = reviewService.getReview(vo);
		model.addAttribute("review", review); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 review : " + review);
		
		return "review.jsp";
	}	
	
	@RequestMapping("/getReviewList.do")
	public String getReviewList(String pCode, Model model) {
		System.out.println(">>> 리뷰 목록 보여주기");
		System.out.println("pCode : " + pCode);

		List<ReviewVO> list = reviewService.getReviewList(pCode);
		model.addAttribute("reviewList", list);
		
		return "review.jsp";
	}
	
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 댓글 입력처리");
		System.out.println("vo : " + vo);
		
		reviewService.insertReview(vo);

		return "review.jsp";
	}

	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 리뷰 삭제처리");
		System.out.println("vo : " + vo);
		
		reviewService.deleteReview(vo);
		
		return "review.jsp";
	}
	
	@RequestMapping("/updateReview.do")
	public String updateReview(@ModelAttribute("review") ReviewVO vo) {
		System.out.println(">>> 게시글 수정처리");
		System.out.println("vo : " + vo);
		
		reviewService.updateReview(vo);
		return "review.do";
	}
}
