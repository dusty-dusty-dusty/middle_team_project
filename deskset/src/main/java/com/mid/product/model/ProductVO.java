
package com.mid.product.model;

import lombok.Data;

@Data
public class ProductVO {
    private String product_no;
    private String cate_id;
    private String admin_no;
    private String product_name;
    private String product_mfc; //제조사
    private Integer product_price;
    private Integer product_stock;
    private String product_image;
    private String product_thum;
    private String product_exp;
    private String product_cont;

}