package com.mid.mypage.repo;

import java.util.List;
import com.mid.mypage.model.OrderVO;

public interface OrderDAO {
    List<OrderVO> getOrderList(String memNo);
    OrderVO getOrder(String orderNo);
    void insertOrder(OrderVO order);
    void updateOrderStatus(OrderVO order);
    List<OrderVO> getOrderListByMemberId(String memId);
} 
// 수정