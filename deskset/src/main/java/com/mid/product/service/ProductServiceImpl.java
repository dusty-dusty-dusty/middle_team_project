package com.mid.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.product.model.ProductVO;
import com.mid.product.model.ReviewVO;
import com.mid.product.repo.ProductDAO;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public ProductVO getProductByNo(String product_no) {
        System.out.println("전달받은 매개변수 확인 : " + product_no); // String 값 출력
        ProductVO result = productDAO.getProductByNo(product_no); // String 값 그대로 넘김
        System.out.println("DB호출값 확인 : " + result);
        return result;
    }
    
    @Override
    public List<ProductVO> getRandomProducts(){
    	 return productDAO.getRandomProducts();
    }
    
    
    @Override
    public List<ProductVO> getProductList(ProductVO vo) {
        return productDAO.getProductList(vo);
    }
    
    @Override
    public List<ProductVO> getKeyboardList(Map<String, Object> map) {
        return productDAO.getKeyboardList(map);
    }

   
	@Override
    public List<ProductVO> getMouseList(Map<String, Object> filters) {
        return productDAO.getMouseList(filters);
    }

    @Override
    public List<ProductVO> getMonitorList(Map<String, Object> filters) {
        return productDAO.getMonitorList(filters);
    }
    
    @Override
    public List<ReviewVO> getReviewsByProductNo(String product_no){
    	return productDAO.getReviewsByProductNo(product_no);
    }
    
    @Override
    public void insertReview(ReviewVO vo) {
    	productDAO.insertReview(vo);
    }
    
    @Override
    public String getOrderDetailNo(String product_no,String mem_no) {
    	return productDAO.getOrderDetailNo(product_no, mem_no);
    }
    
    
    @Override
    public List<String> getProductImagesByNo(String product_no) {
        return productDAO.getProductImagesByNo(product_no);
    }
    
}
