package com.mid.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mid.manager.model.AttrValueDTO;
import com.mid.manager.model.ImgUploadVO;
import com.mid.manager.model.RegistProductDTO;
import com.mid.manager.model.RegistProductVO;
import com.mid.manager.service.AdminProductService;

@Controller
public class AdminProductController {
	@Autowired
	private AdminProductService adminProductService;
	
	//관리자 페이지-상품 관리
	@RequestMapping("manager/admin_product")
	public void productAdministration(Model model) {
		System.out.println("컨트롤러 DB 받은 값 확인 : "+adminProductService.getProductListAD());
		//상품 목록 로딩
		model.addAttribute("productList", adminProductService.getProductListAD());
		model.addAttribute("categoryList", adminProductService.getCategoryListAD());
	}
	
	//관리자 페이지-상품 관리-카테고리 등록
	@RequestMapping("manager/admin_cateregi")
	public void categoriRegister() {
	}
	
	
	//관리자 페이지-상품 관리-상품 등록
	@RequestMapping("manager/admin_proregi")
	public void productRegister(Model model) {
		model.addAttribute("registProductCategory", adminProductService.getCategoryListAD());
	}
	
	//상품등록페이지 - 카테고리 필드 로딩
	@GetMapping("manager/category-fields")
	@ResponseBody
	public ResponseEntity<List<RegistProductVO>> categoryATTRLoad(@RequestParam String category) {
		System.out.println("컨트롤러 categoryATTRLoad 매개변수 확인 : "+category);
		ResponseEntity<List<RegistProductVO>> result = adminProductService.getcategoryATTR(category);
		return result;
	}
	

	// Jackson 없이 수동으로 JSON 파싱하는 버전
	@PostMapping("manager/product-register")
	@ResponseBody
	@Transactional
	public ResponseEntity<Map<String, Object>> registerProduct(
	        @RequestParam("category") String category,
	        @RequestParam("productName") String productName,
	        @RequestParam("price") String price,
	        @RequestParam("quantity") String quantity,
	        @RequestParam(value = "brand", required = false) String brand,
	        @RequestParam(value = "product_thum", required = false) String productThum,
	        @RequestParam(value = "fileIds", required = false) String fileIds,
	        @RequestParam(value = "categoryAttributes", required = false) String categoryAttributesJson,
	        HttpServletRequest request) {
	    
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	        // 기본 상품 정보 설정
	        RegistProductDTO productDTO = new RegistProductDTO();
	        
	        // 카테고리 ID 조회
	        String categoryId = adminProductService.getCategoryIdByName(category);
	        productDTO.setCate_id(categoryId);
	        productDTO.setAdmin_no("1"); // 임시값
	        
	        productDTO.setProduct_name(productName);
	        productDTO.setProduct_mfc(brand);
	        productDTO.setProduct_price(Integer.parseInt(price.replace(",", "")));
	        productDTO.setProduct_stock(Integer.parseInt(quantity));
	        productDTO.setProduct_thum(productThum);
	        productDTO.setProduct_image(fileIds);
	        
	        // 1. 상품 등록
	        adminProductService.insertProduct(productDTO);
	        
	        // 2. 상품 번호 조회
	        String productNo = adminProductService.getLastInsertedProductNo(categoryId);
	        
	        // 3. 동적 속성 처리 (수동 파싱)
	        if (categoryAttributesJson != null && !categoryAttributesJson.trim().isEmpty()) {
	            try {
	                // 간단한 JSON 파싱 (배열 형태의 JSON 가정)
	                List<Map<String, String>> attributes = parseAttributesJson(categoryAttributesJson);
	                
	                // 각 속성을 ATTR_VALUE 테이블에 저장
	                for (Map<String, String> attr : attributes) {
	                    AttrValueDTO attrValueDTO = new AttrValueDTO();
	                    attrValueDTO.setProduct_no(productNo);
	                    attrValueDTO.setAttr_id(attr.get("attr_id"));
	                    attrValueDTO.setAttr_value(attr.get("attr_value"));
	                    
	                    adminProductService.insertAttrValue(attrValueDTO);
	                }
	                
	            } catch (Exception e) {
	                System.err.println("속성 데이터 파싱 오류: " + e.getMessage());
	                e.printStackTrace();
	                throw new RuntimeException("속성 데이터 처리 중 오류 발생", e);
	            }
	        }
	        
	        result.put("status", "success");
	        result.put("message", "상품이 성공적으로 등록되었습니다.");
	        result.put("productNo", productNo);
	        
	        return ResponseEntity.ok(result);
	        
	    } catch (Exception e) {
	        System.err.println("상품 등록 오류: " + e.getMessage());
	        e.printStackTrace();
	        
	        result.put("status", "error");
	        result.put("message", "상품 등록 중 오류가 발생했습니다: " + e.getMessage());
	        
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(result);
	    }
	}

	// 수동 JSON 파싱 메서드
	private List<Map<String, String>> parseAttributesJson(String jsonString) {
	    List<Map<String, String>> attributes = new ArrayList<>();
	    
	    try {
	        // JSON 문자열에서 대괄호 제거
	        jsonString = jsonString.trim();
	        if (jsonString.startsWith("[")) {
	            jsonString = jsonString.substring(1);
	        }
	        if (jsonString.endsWith("]")) {
	            jsonString = jsonString.substring(0, jsonString.length() - 1);
	        }
	        
	        // 객체별로 분리 (},{를 기준으로)
	        String[] objects = jsonString.split("\\},\\{");
	        
	        for (String obj : objects) {
	            obj = obj.trim();
	            // 중괄호 정리
	            if (obj.startsWith("{")) {
	                obj = obj.substring(1);
	            }
	            if (obj.endsWith("}")) {
	                obj = obj.substring(0, obj.length() - 1);
	            }
	            
	            Map<String, String> attrMap = new HashMap<>();
	            
	            // 속성별로 분리 (,를 기준으로)
	            String[] pairs = obj.split(",");
	            for (String pair : pairs) {
	                String[] keyValue = pair.split(":");
	                if (keyValue.length == 2) {
	                    String key = keyValue[0].trim().replace("\"", "");
	                    String value = keyValue[1].trim().replace("\"", "");
	                    attrMap.put(key, value);
	                }
	            }
	            
	            if (!attrMap.isEmpty()) {
	                attributes.add(attrMap);
	            }
	        }
	        
	    } catch (Exception e) {
	        System.err.println("JSON 파싱 오류: " + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return attributes;
	}
	
	
	
	
	//상품이미지 등록
	@PostMapping("/imguploadT")
    @ResponseBody
    public Map<String, Object> uploadFileT(MultipartFile file, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        if (file != null && !file.isEmpty()) {
            try {
                // 서버에 저장할 경로 설정
                String uploadPath = request.getServletContext().getRealPath("/resources/images/thumb/");
                
                // 폴더 없으면 생성
                File folder = new File(uploadPath);
                if (!folder.exists()) {
                    folder.mkdirs();
                }

                // 파일명 중복 방지를 위한 UUID 생성
                String originalName = file.getOriginalFilename();
                String uuid = UUID.randomUUID().toString();
                String savedName = uuid + "_" + originalName;

                // 실제 파일 저장
                File saveFile = new File(uploadPath, savedName);
                file.transferTo(saveFile);

                // VO 생성 및 정보 설정
                ImgUploadVO imgUploadVO = new ImgUploadVO();
                imgUploadVO.setOriginalName(originalName);
                imgUploadVO.setSavedName(savedName);
                imgUploadVO.setUploadPath("/resources/images/thumb/" + savedName);

                // 성공 응답
                result.put("result", "success");
                result.put("fileId", uuid);  // 파일 ID로 UUID 사용
                result.put("filePath", imgUploadVO.getUploadPath());

            } catch (IOException e) {
                e.printStackTrace();
                result.put("result", "fail");
            }
        } else {
            result.put("result", "fail");
        }

        return result;
    }
	
	@PostMapping("/imgupload")
	@ResponseBody
	public Map<String, Object> uploadFile(MultipartFile file, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		
		if (file != null && !file.isEmpty()) {
			try {
				// 서버에 저장할 경로 설정
				String uploadPath = request.getServletContext().getRealPath("/resources/images/product/");
				
				// 폴더 없으면 생성
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdirs();
				}
				
				// 파일명 중복 방지를 위한 UUID 생성
				String originalName = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String savedName = uuid + "_" + originalName;
				
				// 실제 파일 저장
				File saveFile = new File(uploadPath, savedName);
				file.transferTo(saveFile);
				
				// VO 생성 및 정보 설정
				ImgUploadVO imgUploadVO = new ImgUploadVO();
				imgUploadVO.setOriginalName(originalName);
				imgUploadVO.setSavedName(savedName);
				imgUploadVO.setUploadPath("/resources/images/product/" + savedName);
				
				// 성공 응답
				result.put("result", "success");
				result.put("fileId", uuid);  // 파일 ID로 UUID 사용
				result.put("filePath", imgUploadVO.getUploadPath());
				
			} catch (IOException e) {
				e.printStackTrace();
				result.put("result", "fail");
			}
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/imguploadM")
	@ResponseBody
	public Map<String, Object> uploadFileM(MultipartFile file, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();
		
		if (file != null && !file.isEmpty()) {
			try {
				// 서버에 저장할 경로 설정
				String uploadPath = request.getServletContext().getRealPath("/resources/images/product_exp/");
				
				// 폴더 없으면 생성
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdirs();
				}
				
				// 파일명 중복 방지를 위한 UUID 생성
				String originalName = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				String savedName = uuid + "_" + originalName;
				
				// 실제 파일 저장
				File saveFile = new File(uploadPath, savedName);
				file.transferTo(saveFile);
				
				// VO 생성 및 정보 설정
				ImgUploadVO imgUploadVO = new ImgUploadVO();
				imgUploadVO.setOriginalName(originalName);
				imgUploadVO.setSavedName(savedName);
				imgUploadVO.setUploadPath("/resources/images/product_exp/" + savedName);
				
				// 성공 응답
				result.put("result", "success");
				result.put("fileId", uuid);  // 파일 ID로 UUID 사용
				result.put("filePath", imgUploadVO.getUploadPath());
				
			} catch (IOException e) {
				e.printStackTrace();
				result.put("result", "fail");
			}
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

	
	
	
	
	
//---------------------------------------------------------
	
}
