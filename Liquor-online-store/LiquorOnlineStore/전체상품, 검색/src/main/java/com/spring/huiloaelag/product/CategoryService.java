package com.spring.huiloaelag.product;

import java.util.List;

public interface CategoryService {
	List<ProductVO> getAllList(ProductVO vo);
	List<ProductVO> getProductList(ProductVO vo);
}
