package com.mid.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.mid.manager.model.AttrValueDTO;
import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductCAJoinVO;
import com.mid.manager.model.RegistProductDTO;
import com.mid.manager.model.RegistProductVO;
import com.mid.manager.repo.AdminProductDAO;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDAO adminProductDAO;
	
	
	@Override
	public List<ProductCAJoinVO> getProductListAD() {
//		System.out.println("서비스 DB 받은 값 확인 : "+adminProductDAO.getProductListAD());
		List<ProductCAJoinVO> result = adminProductDAO.getProductListAD();
//		System.out.println("서비스 result 값 : "+result);
		return result;
	}

	
	@Override
	public List<CategoryVO> getCategoryListAD() {
		List<CategoryVO> result = adminProductDAO.getCategoryListAD();
		return result;
	}


	@Override
	public ResponseEntity<List<RegistProductVO>> getcategoryATTR(String category) {
		List<RegistProductVO> result = adminProductDAO.getcategoryATTR(category);
		return ResponseEntity.ok(result);
	}
	
	@Override
	public String getCategoryIdByName(String categoryName) {
	    return adminProductDAO.getCategoryIdByName(categoryName);
	}

	@Override
	public void insertProduct(RegistProductDTO productDTO) {
	    adminProductDAO.insertProduct(productDTO);
	}

	@Override
	public String getLastInsertedProductNo(String categoryId) {
	    return adminProductDAO.getLastInsertedProductNo(categoryId);
	}

	@Override
	public void insertAttrValue(AttrValueDTO attrValueDTO) {
	    adminProductDAO.insertAttrValue(attrValueDTO);
	}


	

}
