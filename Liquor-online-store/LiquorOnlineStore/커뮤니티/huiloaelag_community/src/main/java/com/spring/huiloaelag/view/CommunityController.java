package com.spring.huiloaelag.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.huiloaelag.community.CommentsVO;
import com.spring.huiloaelag.community.CommunityService;
import com.spring.huiloaelag.community.CommunityVO;

//@SessionAttributes("community")
@Controller
public class CommunityController {
	//@Autowired
	private CommunityService communityService;
		
	public CommunityController() {
		System.out.println("==========> CommunityController() 객체 생성");
	}
		
	@Autowired
	public CommunityController(CommunityService communityService) {
		System.out.println("==========> CommunityController(communityService) 객체 생성");
		this.communityService = communityService;
	}
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "MTITLE");
		conditionMap.put("내용", "MCONTENT");
		return conditionMap;
	}
	
	//커뮤니티 상세보기
	@RequestMapping("/getCommunity.do")
	public String getCommunity(CommunityVO vo, Model model) {
		System.out.println(">>> 게시글 상세보기");
		System.out.println("vo : " + vo);
		
		CommunityVO community = communityService.getCommunity(vo);
		model.addAttribute("community", community); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 community : " + community);
		
		//댓글 보여주기
		List<CommentsVO> list = communityService.getCommentsList(vo);
		model.addAttribute("commentsList", list);
		
		return "getCommunity.jsp";
	}	
	//커뮤니티 전체 목록
	@RequestMapping("/getCommunityList.do")
	public String getCommunityList(CommunityVO vo, Model model) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);

		List<CommunityVO> list = communityService.getCommunityList(vo);
		model.addAttribute("boardList", list);
		
		return "getCommunityList.jsp";
	}
	//커뮤니티 입력
	@RequestMapping("/insertCommunity.do")
	public String insertCommunity(CommunityVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력처리");
		System.out.println("vo : " + vo);
		
		communityService.insertCommunity(vo);
		
		return "getCommunityList.do";
	}
	//커뮤니티 수정
	@RequestMapping("/updateCommunity.do")
	public String updateCommunity(@ModelAttribute("community") CommunityVO vo) {
		System.out.println(">>> 게시글 수정처리");
		System.out.println("vo : " + vo);
		
		communityService.updateCommunity(vo);
		return "getCommunityList.do";
	}
	//커뮤니티 삭제
	@RequestMapping("/deleteCommunity.do")
	public String deleteCommunity(CommunityVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 게시글 삭제처리");
		System.out.println("vo : " + vo);
		
		communityService.deleteCommunity(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "getCommunityList.do";
	}
	//댓글 입력
	@RequestMapping("/insertComment.do")
	public String insertComments(CommentsVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 댓글 입력처리");
		System.out.println("vo : " + vo);
		
		communityService.insertComment(vo);
		
		return "getCommunity.do";
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping("/deleteComment.do")
	public int deleteCommunity(CommentsVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 댓글 삭제처리");
		System.out.println("vo : " + vo);
		
		int result = communityService.deleteComment(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return result;
		//return "getCommunity.do";
	}
	//댓글 수정
	@RequestMapping("/updateComment.do")
	public String updateComment(CommentsVO vo) {
		System.out.println(">>> 댓글 수정처리");
		System.out.println("vo : " + vo);
		
		communityService.updateComment(vo);
		return "getCommunity.do";
	}
	//댓글의 비밀번호 받아오기(수정시에 사용)
	@ResponseBody
	@RequestMapping("/getComment.do")
	public String getComment(String cmtCode, Model model) {
		System.out.println(">>> 댓글 하나보기");
		System.out.println("cmtCode : " + cmtCode);
		
		String comment = communityService.getComment(cmtCode);
		model.addAttribute("comment", comment); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 comment : " + comment);

		return comment.toString();
	}
    
}
