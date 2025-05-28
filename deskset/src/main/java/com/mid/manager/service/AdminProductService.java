package com.mid.manager.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductCAJoinVO;
import com.mid.manager.model.RegistProductVO;

public interface AdminProductService {

	//카테고리 목록 불러오기
	List<CategoryVO> getCategoryListAD();

	//제품 목록 불러오기
	List<ProductCAJoinVO> getProductListAD();

	ResponseEntity<RegistProductVO> getcategoryATTR(String category);
	

}
