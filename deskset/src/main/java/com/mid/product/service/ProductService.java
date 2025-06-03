package com.mid.product.service;

import java.util.List;
import java.util.Map;

import com.mid.product.model.ProductVO;
import com.mid.product.model.ReviewVO;

public interface ProductService {
	
	
	//제품 상세보기
    public ProductVO getProductByNo(String product_no);
    
    //제품 상품
    List<ProductVO> getRandomProducts();
    
    //제품 기본 검색
    List<ProductVO> getProductList(ProductVO vo); 
    
    
    //필터별 검색
    List<ProductVO> getKeyboardList(Map<String,Object> filters);
    List<ProductVO> getMouseList(Map<String,Object> filters);
    List<ProductVO> getMonitorList(Map<String,Object> filters);

	//상세 이미지 가져오기
    List<String> getProductImagesByNo(String product_no);
    
    //제품리뷰
    List<ReviewVO> getReviewsByProductNo(String product_no);
    
    
    
    void insertReview(ReviewVO vo);
    
    
    String getOrderDetailNo(String product_no,String mem_no);
}
