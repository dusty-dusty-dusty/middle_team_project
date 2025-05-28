package com.mid.manager.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("category-fields")
	@ResponseBody
	public ResponseEntity<RegistProductVO> categoryATTRLoad(@RequestParam String category) {
		
		ResponseEntity<RegistProductVO> result = adminProductService.getcategoryATTR(category);
		return result;
		
	}
	
	
//---------------------------------------------------------
	
}
