package com.spring.huiloaelag.view.qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.huiloaelag.qna.QnaService;
import com.spring.huiloaelag.qna.QnaVO;

@SessionAttributes("qna")
@Controller
public class QnaController {
	//@Autowired
	private QnaService QnaService;
	
	public QnaController() {
		System.out.println("==========> QnaController() 객체 생성");
	}
	
	@Autowired
	public QnaController(QnaService QnaService) {
		System.out.println("==========> QnaController(QnaService) 객체 생성");
		this.QnaService = QnaService;
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("=====> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("작성자", "NAME");
		return conditionMap;
	}

	// 리턴타입 : ModelAndView ---> String
	@RequestMapping("/getQna.do")
	public String getQna(QnaVO vo, Model model) {
		System.out.println(">>> 게시글 상세보기");
		System.out.println("vo : " + vo);
		
		QnaVO qna = QnaService.getQna(vo);
		model.addAttribute("qna", qna); // Model 객체 사용 View에 데이터 전달
		System.out.println("DB데이터 qna : " + qna);
		
		return "getQna.jsp";
	}	
	
	@RequestMapping("/getQnaList.do")
	public String getQnaList(QnaVO vo, Model model) {
		System.out.println(">>> 게시글 전체 목록 보여주기");
		System.out.println("vo : " + vo);

		List<QnaVO> list = QnaService.getQnaList(vo);
		model.addAttribute("qnaList", list);
		
		return "QnA/getQnaList";
	}
	
	@RequestMapping("/insertQna.do")
	public String insertQna(QnaVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력처리");
		System.out.println("vo : " + vo);
		
		QnaService.insertQna(vo);
		
		return "QnA/getQnaList";
	}
	
	@RequestMapping("/insertQnaGo.do")
	public String insertQnaGo() {
		return "QnA/insertQna";
	}

	@RequestMapping("/updateQna.do")
	public String updateQna(@ModelAttribute("qna") QnaVO vo) {
		System.out.println(">>> 게시글 수정처리");
		System.out.println("vo : " + vo);
		
		QnaService.updateQna(vo);
		return "getQnaList.do";
	}
	
	@RequestMapping("/deleteQna.do")
	public String deleteQna(QnaVO vo, SessionStatus sessionStatus) {
		System.out.println(">>> 게시글 삭제처리");
		System.out.println("vo : " + vo);
		
		QnaService.deleteQna(vo);
		sessionStatus.setComplete(); //session 데이터 삭제
		
		return "getQnaList.do";
	}
	
	//지역별 카테고리!!!
	@RequestMapping("/getAreaList.do")
	public String getAreaList(QnaVO vo, Model model) {
		
		return "categoryArea/categoryArea";
	}
	
//	public int getQnaTotalCount() {
//		int totalCount = QnaService.getQnaTotalCount();
//		return totalCount;
//		
//	}
//	
//	public List<QnaVO> getQnaList(Map<String, Integer> map) {
//		List<QnaVO> list = QnaService.getQnaList(map);
//		return list;
//	}
//	
////	@RequestMapping("/getQnaList.do")
//	public String getQnaList(int begin, int end, Model model) {
//		System.out.println(">>> 게시글 전체 목록 보여주기");
//		
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("begin", begin);
//		map.put("end", end);
//		
//		List<QnaVO> list = QnaService.getQnaList(begin, end);
//		model.addAttribute("qnaList", list);
//		
//		return "getQnaList.jsp";
//	}
	
	
}
