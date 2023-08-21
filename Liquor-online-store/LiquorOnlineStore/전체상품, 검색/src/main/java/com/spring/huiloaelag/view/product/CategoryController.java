package com.spring.huiloaelag.view.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.huiloaelag.product.ProductVO;
import com.spring.huiloaelag.product.CategoryService;

/*
@SessionAttributes : 같은 컨트롤러에서 모델(Model)객체 공유해서 사용하려는 경우 사용
	단, 현재(동일) 컨트롤러에서만 사용가능
	사용후에는 SessionStatus 객체의 setComplete() 메소드로 사용해제
*/
@SessionAttributes("category") // category 라는 이름의 Model 객체가 있으면 session 에 저장
@Controller
public class CategoryController {
	//@Autowired
	private CategoryService categoryService;
	
	public CategoryController() {
		System.out.println("==========> CategoryController() 객체 생성");
	}
	
	@Autowired
	public CategoryController(CategoryService categoryService) {
		System.out.println("==========> CategoryController(categoryService) 객체 생성");
		this.categoryService = categoryService;
	}
	
	@RequestMapping("/getAllList.do")
	public String getAllList(ProductVO vo, Model model) {
		System.out.println(">>> 전체목록 보여주기");
		System.out.println("vo : " + vo);

		List<ProductVO> list = categoryService.getAllList(vo);
		model.addAttribute("allList", list);
		System.out.println("list: " + list);
		
		return "allList.jsp";
	}
	
	@RequestMapping("/getProductList.do")
	public String getProductList(ProductVO vo, Model model) {
		System.out.println(">>> 카테고리(종류) 목록 보여주기");
		System.out.println("vo : " + vo);

		List<ProductVO> list = categoryService.getProductList(vo);
		model.addAttribute("categoryList", list);
		System.out.println("list: " + list);
		
		return "category.jsp";
	}
	
}
