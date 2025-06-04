package com.mid.manager.repo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mid.common.model.AttrVO;
import com.mid.common.model.CategoryVO;

@Mapper
public interface AdminCategoryDAO {
	  /**
     * PREFIX 코드 중복 확인을 위한 카운트 조회
     * @param prefixCode PREFIX 코드
     * @return 해당 PREFIX를 사용하는 카테고리 수
     */
    int countByPrefix(String prefixCode);
    
    /**
     * 카테고리 등록
     * @param category 카테고리 정보
     * @return 등록된 행 수
     */
    int insertCategory(CategoryVO category);
    
    /**
     * 마지막으로 등록된 카테고리 ID 조회
     * @return 카테고리 ID
     */
    String getLastInsertedCateId();
    
    /**
     * 속성 등록
     * @param attr 속성 정보
     * @return 등록된 행 수
     */
    int insertAttribute(AttrVO attr);
    
    /**
     * 모든 카테고리 조회
     * @return 카테고리 목록
     */
    List<CategoryVO> selectAllCategories();
    
    /**
     * 특정 카테고리의 속성 조회
     * @param cateId 카테고리 ID
     * @return 속성 목록
     */
    List<AttrVO> selectAttributesByCategory(String cateId);
    
    /**
     * 카테고리 삭제
     * @param cateId 카테고리 ID
     * @return 삭제된 행 수
     */
    int deleteCategory(String cateId);
    
    /**
     * 카테고리의 모든 속성 삭제
     * @param cateId 카테고리 ID
     * @return 삭제된 행 수
     */
    int deleteAttributesByCategory(String cateId);
}
