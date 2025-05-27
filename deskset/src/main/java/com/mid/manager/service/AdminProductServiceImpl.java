package com.mid.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductVO;
import com.mid.manager.repo.AdminProductDAO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDAO adminProductDAO;
	
	
	@Override
	public List<ProductVO> getProductListAD() {
//		System.out.println("서비스 DB 받은 값 확인 : "+adminProductDAO.getProductListAD());
		List<ProductVO> result = adminProductDAO.getProductListAD();
//		System.out.println("서비스 result 값 : "+result);
		return result;
	}

	
	@Override
	public List<CategoryVO> getCategoryListAD() {
		List<CategoryVO> result = adminProductDAO.getCategoryListAD();
		return result;
	}

}
