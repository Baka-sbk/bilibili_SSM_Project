package com.zilizili.service;

import java.util.List;

import com.zilizili.pojo.Cart;

public interface CartService {
	//添加到购物车
	int addCart(String userId,String goodId);
	
	//获得指定用户id的购物车对象
	List<Cart> getCartByUserId(String userId);
	
}
