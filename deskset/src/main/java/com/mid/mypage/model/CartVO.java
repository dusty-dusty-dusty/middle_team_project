package com.mid.mypage.model;

import lombok.Data;
// �옣諛붽뎄�땲 愿��젴 VO

@Data
public class CartVO {
    private String cartId;          // �옣諛붽뎄�땲 ID (�깉濡� 異붽��맖)
    private String memNo;           // �쉶�썝踰덊샇 - �궗�슜�옄 �떇蹂�
    private String productNo;       // �긽�뭹踰덊샇 - �긽�뭹 �떇蹂�
    private int cartQuantity;       // �옣諛붽뎄�땲 �닔�웾 - �궗�슜�옄媛� �꽑�깮�븳 �긽�뭹 �닔�웾
    
    // JOIN�쓣 �넻�빐 媛��졇�삤�뒗 異붽� �븘�뱶 (PRODUCT �뀒�씠釉붿뿉�꽌)
    private String productName;     // �긽�뭹紐� - �옣諛붽뎄�땲 �솕硫댁뿉 �몴�떆�븷 �긽�뭹 �씠由�
    private int productPrice;       // �긽�뭹 媛�寃� - �옣諛붽뎄�땲 �솕硫댁뿉 �몴�떆�븷 �긽�뭹 �떒媛�
    private String productThum;     // �긽�뭹 �뜽�꽕�씪 �씠誘몄� - �옣諛붽뎄�땲 紐⑸줉�뿉 �몴�떆�릺�뒗 �옉�� �씠誘몄�/} */
}