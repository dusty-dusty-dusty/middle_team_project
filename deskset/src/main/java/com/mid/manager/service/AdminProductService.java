package com.mid.manager.service;

import java.util.List;

import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductVO;

public interface AdminProductService {

	//카테고리 목록 불러오기
	List<CategoryVO> getCategoryListAD();

	//제품 목록 불러오기
	List<ProductVO> getProductListAD();
	

}
