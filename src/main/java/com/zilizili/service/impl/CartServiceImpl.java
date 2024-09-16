package com.zilizili.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zilizili.dao.CartMapper;
import com.zilizili.dao.OrderMapper;
import com.zilizili.pojo.Cart;
import com.zilizili.pojo.CartExample;
import com.zilizili.pojo.CartExample.Criteria;
import com.zilizili.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;

	@Override
	public int addCart(String userId,String goodId) {
		Cart cart = new Cart();
		
		String cartId = UUID.randomUUID()+"zilizili";
		System.out.println("cartId--->"+cartId);
		cart.setCartId(cartId);
		cart.setCommodityId(userId);
		cart.setUserId(userId);

		return mapper.insert(cart);

	}

	@Override
	public List<Cart> getCartByUserId(String userId) {
		CartExample example = new CartExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(userId);
		List<Cart> list = mapper.selectByExample(example);
		
		return list;
	}

}
