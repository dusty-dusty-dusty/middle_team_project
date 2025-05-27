package com.mid.manager.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductVO;

@Mapper
public interface AdminProductDAO {
	public List<ProductVO> getProductListAD();
	public List<CategoryVO> getCategoryListAD();
}
