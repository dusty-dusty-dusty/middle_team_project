package com.mid.product.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mid.product.model.ProductVO;
import com.mid.product.model.ReviewVO;
import com.mid.product.service.ProductService;

@Controller
public class ProductController {

	
	@Autowired
	private HttpSession session;
	
	
    @Autowired
    private ProductService productService; 

    @RequestMapping("/product/sub_product")
    public String getProduct(
    	    @RequestParam("product_no") String product_no,
    	    @RequestParam(value = "review_cont", required = false) String review_cont,
    	    @RequestParam(value = "review_rating", required = false) Integer review_rating,
    	    @RequestParam(value = "order_detail_no", required = false) String order_detail_no,
    	    Model model
    	   
    	) {
    	    System.out.println("넘어온 product_no: " + product_no);
    	    
    	    //로그인 사용자 정보 가져오기
    	    String mem_no =(String) session.getAttribute("mem_no"); 
    	    
    	    
    	    // 로그인 안 되어 있으면 리뷰 작성 불가
    	    if (review_cont != null && review_rating != null && mem_no != null) {
    	        ReviewVO vo = new ReviewVO();
    	        vo.setProduct_no(product_no);
    	        vo.setOrder_detail_no(order_detail_no);
    	        vo.setMem_no(mem_no);  // 세션에서 가져온 값으로 설정
    	        vo.setReview_cont(review_cont);
    	        vo.setReview_rating(review_rating);

    	        productService.insertReview(vo);
    	        System.out.println("리뷰 등록 완료: " + vo.toString());
    	    }

    	
    	
    	
    	
    	//상품 정보,리뷰 리스트 가져오기
        ProductVO product = productService.getProductByNo(product_no);
        List<ReviewVO> reviewList = productService.getReviewsByProductNo(product_no);
        if (product == null) {
            System.out.println("상품 정보가 없습니다!");
        } else {
            System.out.println("DB호출값 확인: " + product.toString());
        }
        model.addAttribute("product", product);
        model.addAttribute("reviewList",reviewList);
        
        return "product/sub_product"; // 반드시 뷰 이름 반환!
    }
    
  
    // 키보드 필터링
    @RequestMapping("/product/sub_list")
    public String getKeyboardList(
            @RequestParam(value = "brand", required = false) List<String> brand,
            @RequestParam(value = "switch", required = false) List<String> switchList,
            @RequestParam(value = "layout", required = false) List<String> layout,
            @RequestParam(value = "interface", required = false) List<String> interfaceList,
            @RequestParam(value = "response", required = false) List<String> responseList,
            @RequestParam(value = "housing", required = false) List<String> housingList,
            @RequestParam(value = "sort", required = false) String sort,
            Model model) {

        Map<String, Object> map = new HashMap<>();
        map.put("brand", brand);
        map.put("switch", switchList);
        map.put("layout", layout);
        map.put("interface", interfaceList);
        map.put("response", responseList);
        map.put("housing", housingList);
        map.put("sort", sort);

        List<ProductVO> productList = productService.getKeyboardList(map);
        model.addAttribute("keyboardList", productList);

        return "product/sub_list"; // 키보드 리스트 JSP
    }

 // 마우스 필터링
    @RequestMapping("/product/sub_list2")
    public String getMouseList(
            @RequestParam(value = "weight", required = false) List<String> weight,
            @RequestParam(value = "dpi", required = false) List<String> dpi,
            @RequestParam(value = "response", required = false) List<String> responseList,
            @RequestParam(value = "sensor", required = false) List<String> sensorList,
            @RequestParam(value = "switch", required = false) List<String> switchList,
            @RequestParam(value = "interface", required = false) List<String> interfaceList,
            @RequestParam(value = "sort", required = false) String sort,
            Model model) {

        Map<String, Object> map = new HashMap<>();
        map.put("weight", weight);
        map.put("dpi", dpi);
        map.put("response", responseList);
        map.put("sensor", sensorList);
        map.put("switch", switchList);
        map.put("interface", interfaceList);
        map.put("sort", sort);

        List<ProductVO> mouseList = productService.getMouseList(map);
        model.addAttribute("mouseList", mouseList);
        return "/product/sub_list2";
    }

 // 모니터 필터링
    @RequestMapping("/product/sub_list3")
    public String getMonitorList(
            @RequestParam(value = "size", required = false) List<String> size,
            @RequestParam(value = "panel", required = false) List<String> panel,
            @RequestParam(value = "resolution", required = false) List<String> resolution,
            @RequestParam(value = "hz", required = false) List<String> hz,
            @RequestParam(value = "response", required = false) List<String> responseList,
            @RequestParam(value = "sort", required = false) String sort,
            Model model) {

        Map<String, Object> map = new HashMap<>();
        map.put("size", size);
        map.put("panel", panel);
        map.put("resolution", resolution);
        map.put("hz", hz);
        map.put("response", responseList);
        map.put("sort", sort);

        List<ProductVO> monitorList = productService.getMonitorList(map);
        model.addAttribute("monitorList", monitorList);
        return "/product/sub_list3";
    }
    
    
    
    @RequestMapping("main/main_page")
    public String mainPage(Model model) {
        List<ProductVO> randomProducts = productService.getRandomProducts(); // 랜덤 6개 상품 조회
        model.addAttribute("randomProducts", randomProducts);
        return "main/main_page"; // main_page.jsp로 이동
    }
    
    
    
  
}
