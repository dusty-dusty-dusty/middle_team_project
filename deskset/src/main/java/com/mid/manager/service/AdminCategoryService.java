package com.mid.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mid.common.model.AttrVO;
import com.mid.common.model.CategoryVO;
import com.mid.manager.repo.AdminCategoryDAO;

@Service
public class AdminCategoryService {
    
    @Autowired
    private AdminCategoryDAO categoryMapper;
    
    /**
     * PREFIX 코드 사용 가능 여부 확인
     * @param prefixCode PREFIX 코드
     * @return 사용 가능 여부 (true: 사용 가능, false: 이미 사용중)
     */
    public boolean isPrefixAvailable(String prefixCode) {
        int count = categoryMapper.countByPrefix(prefixCode);
        return count == 0;
    }
    
    /**
     * 카테고리 및 속성 등록
     * @param category 카테고리 정보
     * @param properties 속성 목록
     * @return 등록 성공 여부
     */
    @Transactional
    public boolean registerCategory(CategoryVO category, List<String> properties) {
        try {
            // 1. PREFIX 중복 확인
            if (!isPrefixAvailable(category.getPn_prefix())) {
                throw new RuntimeException("이미 사용중인 PREFIX 코드입니다.");
            }
            
            // 2. 카테고리 등록
            int categoryResult = categoryMapper.insertCategory(category);
            if (categoryResult <= 0) {
                throw new RuntimeException("카테고리 등록에 실패했습니다.");
            }
            
            // 3. 등록된 카테고리 ID 조회 (시퀀스로 생성된 ID)
            String cateId = categoryMapper.getLastInsertedCateId();
            if (cateId == null) {
                throw new RuntimeException("등록된 카테고리 ID를 조회할 수 없습니다.");
            }
            
            // 4. 속성 등록 (속성이 있는 경우만)
            if (properties != null && !properties.isEmpty()) {
                for (String propertyName : properties) {
                    if (propertyName != null && !propertyName.trim().isEmpty()) {
                        AttrVO attr = new AttrVO();
                        attr.setCate_id(cateId);
                        attr.setAttr_name(propertyName.trim());
                        
                        int attrResult = categoryMapper.insertAttribute(attr);
                        if (attrResult <= 0) {
                            throw new RuntimeException("속성 등록에 실패했습니다: " + propertyName);
                        }
                    }
                }
            }
            
            return true;
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("카테고리 등록 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
    
    /**
     * 모든 카테고리 조회
     * @return 카테고리 목록
     */
    public List<CategoryVO> getAllCategories() {
        return categoryMapper.selectAllCategories();
    }
    
    /**
     * 특정 카테고리의 속성 조회
     * @param cateId 카테고리 ID
     * @return 속성 목록
     */
    public List<AttrVO> getAttributesByCategory(String cateId) {
        return categoryMapper.selectAttributesByCategory(cateId);
    }
}
