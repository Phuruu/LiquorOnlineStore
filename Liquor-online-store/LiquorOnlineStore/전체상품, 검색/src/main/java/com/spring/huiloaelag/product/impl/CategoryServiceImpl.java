package com.spring.huiloaelag.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.huiloaelag.product.ProductVO;
import com.spring.huiloaelag.product.CategoryService;
import com.spring.huiloaelag.product.dao.CategoryDAO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	public CategoryServiceImpl() {
		System.out.println(">> CategoryServiceImpl() 객체 생성");
	}
	
	@Override
	public List<ProductVO> getAllList(ProductVO vo) {
		return categoryDAO.getAllList(vo);
	}
	
	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return categoryDAO.getProductList(vo);
	}

}
