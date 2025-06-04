package com.mid.manager.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mid.common.model.CategoryVO;
import com.mid.manager.service.AdminCategoryService;

@Controller
@RequestMapping("manager")
public class AdminCategoryController {
	  @Autowired
	    private AdminCategoryService adminCategoryService;
	    
	    /**
	     * 카테고리 등록 처리
	     * @param categoryData 카테고리 데이터 (카테고리명, PREFIX 코드, 속성 목록)
	     * @return 등록 결과
	     */
	    @PostMapping("/category_register")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> registerCategory(@RequestBody Map<String, Object> categoryData) {
	        try {
	            String categoryName = (String) categoryData.get("category");
	            String prefixCode = (String) categoryData.get("prefixCode");
	            @SuppressWarnings("unchecked")
	            List<String> properties = (List<String>) categoryData.get("properties");
	            
	            // 입력값 검증
	            if (categoryName == null || categoryName.trim().isEmpty()) {
	                return ResponseEntity.badRequest()
	                    .body(Map.of("success", false, "message", "카테고리명을 입력해주세요."));
	            }
	            
	            if (prefixCode == null || prefixCode.trim().isEmpty()) {
	                return ResponseEntity.badRequest()
	                    .body(Map.of("success", false, "message", "PREFIX 코드를 입력해주세요."));
	            }
	            
	            // PREFIX 코드 유효성 검증 (A~Z, 1~2글자)
	            if (!prefixCode.matches("^[A-Z]{1,2}$")) {
	                return ResponseEntity.badRequest()
	                    .body(Map.of("success", false, "message", "PREFIX 코드는 A~Z 대문자 1~2글자로 입력해주세요."));
	            }
	            
	            // CategoryVO 생성
	            CategoryVO category = new CategoryVO();
	            category.setCate_name(categoryName.trim());
	            category.setPn_prefix(prefixCode.trim());
	            
	            // 카테고리 등록 서비스 호출
	            boolean result = adminCategoryService.registerCategory(category, properties);
	            
	            if (result) {
	                return ResponseEntity.ok(Map.of("success", true, "message", "카테고리가 성공적으로 등록되었습니다."));
	            } else {
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                    .body(Map.of("success", false, "message", "카테고리 등록에 실패했습니다."));
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("success", false, "message", "서버 오류가 발생했습니다: " + e.getMessage()));
	        }
	    }
	    
	    /**
	     * PREFIX 코드 중복 확인
	     * @param prefixData PREFIX 코드 데이터
	     * @return 중복 여부
	     */
	    @PostMapping("/check_prefix")
	    @ResponseBody
	    public ResponseEntity<Map<String, Object>> checkPrefix(@RequestBody Map<String, String> prefixData) {
	        try {
	            String prefixCode = prefixData.get("prefixCode");
	            
	            if (prefixCode == null || prefixCode.trim().isEmpty()) {
	                return ResponseEntity.badRequest()
	                    .body(Map.of("available", false, "message", "PREFIX 코드를 입력해주세요."));
	            }
	            
	            boolean isAvailable = adminCategoryService.isPrefixAvailable(prefixCode.trim());
	            
	            if (isAvailable) {
	                return ResponseEntity.ok(Map.of("available", true, "message", "사용 가능한 PREFIX 코드입니다."));
	            } else {
	                return ResponseEntity.ok(Map.of("available", false, "message", "이미 사용중인 PREFIX 코드입니다."));
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body(Map.of("available", false, "message", "서버 오류가 발생했습니다."));
	        }
	    }
}
