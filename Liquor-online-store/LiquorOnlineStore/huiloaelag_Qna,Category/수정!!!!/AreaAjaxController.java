package com.spring.huiloaelag.view.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.huiloaelag.admin.ProductVO;
import com.spring.huiloaelag.qna.QnaService;

@RestController
public class AreaAjaxController {
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/getJsonAreaList.do")
	//@ResponseBody // response 응답객체의 몸체(body)에 데이터 전달
	public List<ProductVO> getJsonAreaList(ProductVO vo,
			@RequestParam(value = "pLocal", required = false) String pLocal) {
		
		System.out.println("====== AreaAjaxController.getAjaxAreaList() 실행");
		System.out.println(pLocal);
		System.out.println(vo);
		List<ProductVO> areaList = qnaService.getAreaList(pLocal);
		System.out.println("areaList : " + areaList);
		
		return areaList;
	}
	
//	@RequestMapping(value = "/getJsonBoard.do", method = RequestMethod.POST,
//			produces = "application/json;charset=UTF-8")
//	//@ResponseBody
//	public BoardVO getJsonBoard(@RequestBody BoardVO vo) { //@RequestBody post방식 전달 데이터 처리
//		System.out.println("====== BoardAjaxController.getJsonBoard() 실행");
//		System.out.println("getJsonBoard() vo : " + vo);
//		BoardVO board = boardService.getBoard(vo);
//		System.out.println("getJsonBoard() board : " + board);
//		
//		return board;
//	}

}
