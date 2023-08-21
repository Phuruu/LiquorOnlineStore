package com.spring.huiloaelag.product.dao;

import java.util.List;

import com.spring.huiloaelag.product.ProductVO;

public interface CategoryDAO {
	List<ProductVO> getAllList(ProductVO vo);
	List<ProductVO> getProductList(ProductVO vo);
}
