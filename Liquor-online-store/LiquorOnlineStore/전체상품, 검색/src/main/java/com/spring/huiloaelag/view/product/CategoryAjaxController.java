package com.spring.huiloaelag.view.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.huiloaelag.product.ProductVO;
import com.spring.huiloaelag.product.SearchService;


//@Controller
@RestController // 클래스 내의 요청처리 결과가 모두 @ResponseBody 처리됨
public class CategoryAjaxController {
	@Autowired
	private SearchService categoryService;
	
	@RequestMapping("/getJsonProduct.do")
	//@ResponseBody // response 응답객체의 몸체(body)에 데이터 전달
	public List<ProductVO> getJsonBoardList(ProductVO vo){
		System.out.println("===== ProductAjaxController.getJsonProduct() 실행");
		List<ProductVO> categoryList = categoryService.getSearchList(vo);
		System.out.println("categoryList : " + categoryList);
		
		return categoryList;
	}

	
}












