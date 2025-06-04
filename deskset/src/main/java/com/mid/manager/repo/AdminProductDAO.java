package com.mid.manager.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mid.common.model.ProductExpImgVO;
import com.mid.manager.model.AttrValueDTO;
import com.mid.manager.model.CategoryVO;
import com.mid.manager.model.ProductCAJoinVO;
import com.mid.manager.model.RegistProductDTO;
import com.mid.manager.model.RegistProductVO;

@Mapper
public interface AdminProductDAO {
	public List<ProductCAJoinVO> getProductListAD();
	public List<CategoryVO> getCategoryListAD();
	public List<RegistProductVO> getcategoryATTR(String selectedCategory);
	
	public String getCategoryIdByName(String categoryName);
	public void insertProduct(RegistProductDTO productDTO);
	public String getLastInsertedProductNo(String categoryId);
	public void insertAttrValue(AttrValueDTO attrValueDTO);
	
	void insertProductExpImg(ProductExpImgVO productExpImgVO);
}
