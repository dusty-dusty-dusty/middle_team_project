package com.mid.manager.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.mid.manager.model.AttrValueDTO;
import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductCAJoinVO;
import com.mid.manager.model.RegistProductDTO;
import com.mid.manager.model.RegistProductVO;

public interface AdminProductService {

	//카테고리 목록 불러오기
	List<CategoryVO> getCategoryListAD();

	//제품 목록 불러오기
	List<ProductCAJoinVO> getProductListAD();

	ResponseEntity<List<RegistProductVO>> getcategoryATTR(String category);
	
	

    /**
     * 카테고리명으로 카테고리 ID 조회
     */
    String getCategoryIdByName(String categoryName);
    
    /**
     * 상품 등록 (시퀀스와 트리거 사용)
     */
    void insertProduct(RegistProductDTO productDTO);
    
    /**
     * 최근 등록된 상품 번호 조회 (특정 카테고리)
     */
    String getLastInsertedProductNo(String categoryId);
    
    /**
     * 속성값 저장
     */
    void insertAttrValue(AttrValueDTO attrValueDTO);

    

    

}
