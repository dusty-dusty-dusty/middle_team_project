package com.mid.product.repo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mid.product.model.ProductVO;
import com.mid.product.model.ReviewVO;

@Mapper
public interface ProductDAO {
    public ProductVO getProductByNo(String product_no);
    
    
   
    List<ProductVO> getRandomProducts();
    
    List<ProductVO> getProductList(ProductVO vo);
    
    List<ProductVO> getKeyboardList(Map<String, Object> map);
    List<ProductVO> getMouseList(Map<String, Object> filters);
    List<ProductVO> getMonitorList(Map<String, Object> filters);
    
    List<String> getProductImagesByNo(String product_no);
    
    List<ReviewVO> getReviewsByProductNo(String product_no);
    
    void insertReview(ReviewVO vo);
    
    //리뷰order_detail_no찿기
    String getOrderDetailNo(@Param("product_no")String product_no, @Param("mem_no") String mem_no);
}
