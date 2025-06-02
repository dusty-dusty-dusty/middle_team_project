package com.mid.manager.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductCAJoinVO;
import com.mid.manager.model.RegistProductVO;

@Mapper
public interface AdminProductDAO {
	public List<ProductCAJoinVO> getProductListAD();
	public List<CategoryVO> getCategoryListAD();
	public List<RegistProductVO> getcategoryATTR(String selectedCategory);
}
