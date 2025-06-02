package com.mid.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mid.manager.model.ImgUploadVO;
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
	
	//상품이미지 등록
	@PostMapping("/imguploadT")
    @ResponseBody
    public Map<String, Object> uploadFile(MultipartFile file, HttpServletRequest request) {
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

	
	
	
	
	
//---------------------------------------------------------
	
}
