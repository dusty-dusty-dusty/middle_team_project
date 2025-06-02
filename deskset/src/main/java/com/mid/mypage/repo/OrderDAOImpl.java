package com.mid.mypage.repo;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.mid.mypage.model.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public List<OrderVO> getOrderList(String memNo) {
        return sqlSession.selectList("com.mid.mypage.repo.OrderDAO.getOrderList", memNo);
    }
    
    @Override
    public OrderVO getOrder(String orderNo) {
        return sqlSession.selectOne("com.mid.mypage.repo.OrderDAO.getOrder", orderNo);
    }
    
    @Override
    public void insertOrder(OrderVO order) {
        sqlSession.insert("com.mid.mypage.repo.OrderDAO.insertOrder", order);
    }
    
    @Override
    public void updateOrderStatus(OrderVO order) {
        sqlSession.update("com.mid.mypage.repo.OrderDAO.updateOrderStatus", order);
    }
    
    @Override
    public List<OrderVO> getOrderListByMemberId(String memId) {
        return sqlSession.selectList("com.mid.mypage.repo.OrderDAO.getOrderListByMemberId", memId);
    }
    
    @Override
    public Map<String, Object> checkOrderData(String memId) {
        return sqlSession.selectOne("com.mid.mypage.repo.OrderDAO.checkOrderData", memId);
    }
} 