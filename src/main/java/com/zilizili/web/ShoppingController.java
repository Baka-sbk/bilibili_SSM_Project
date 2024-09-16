package com.zilizili.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zilizili.pojo.Cart;
import com.zilizili.pojo.Commodity;
import com.zilizili.service.CartService;
import com.zilizili.service.CommodityService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

	@Autowired
	private CommodityService service;

	@Autowired
	private CartService cartService;

	// 商品列表
	@ResponseBody
	@RequestMapping("/getAllCommodity/{currPage}/{pageSize}")
	public Map<String, Object> getAllCommodity(Model model, @PathVariable("currPage") String currPage,
			@PathVariable("pageSize") String pageSize) {
		// String pageNum
		System.out.println("getAllCommodity");
		Map<String, Object> map = new HashMap<>();
		// Integer.parseInt(pageNum)
		System.out.println(currPage + "---->" + pageSize);
		PageHelper.startPage(Integer.parseInt(currPage), Integer.parseInt(pageSize));
		List<Commodity> list = service.getAllCommodity();

		PageInfo<Commodity> info = new PageInfo<Commodity>(list);
		int totalPage = info.getPages();
		System.out.println("totalpage--->" + totalPage);

		map.put("list", list);
		map.put("totalpage", totalPage);
		return map;
	}

	// 添加购物车
	@ResponseBody
	@RequestMapping("/addCart/{id}/{userId}")
	public Map<String, Object> addCart(@PathVariable("id") String goodId, @PathVariable("userId") String userId) {
		System.out.println("addCart");
		Map<String, Object> map = new HashMap<>();

		Commodity commodity = service.getCommodity(goodId);
		// 对象返回
		map.put("good", commodity);
		// 加入购物车是否成功
		map.put("addCartRs", cartService.addCart(userId, goodId));

		return map;
	}

	// 获取单个商品信息
	@RequestMapping("/getCommodity/{goodId}/{userId}")
	public String getCommodity(Model model, @PathVariable("goodId") String goodId,
			@PathVariable("userId") String userId) {
		System.out.println("getCommodity");

		Commodity commodity = service.getCommodity(goodId);

		model.addAttribute("good", commodity);

		return "shoppingCart";
	}

	@ResponseBody
	@RequestMapping("/Buy/{goodId}/{userId}/{goodNum}")
	public Map<String, Object> buy(Model model, @PathVariable("goodId") String goodId, @PathVariable("userId") String userId,
			@PathVariable("goodNum") String num,HttpServletRequest request) {
		
		System.out.println("buy");
		Map<String, Object> map = new HashMap<>();

		Commodity commodity = service.getCommodity(goodId);
		// 对象返回
		map.put("good", commodity);
		
		
		for (int i = 0; i < Integer.parseInt(num); i++) {
			// 加入购物车是否成功
			map.put("addCartRs", cartService.addCart(userId, goodId));
		}
		
		
		
		
		List<Cart> list = cartService.getCartByUserId(userId);
		
		map.put("cartList", list);
		request.getSession().setAttribute("cart",list);
		
		return map;

		
		
	}
	
	@RequestMapping("/goGood/{goodId}/{userId}")
	public String goGood(Model model,@PathVariable("goodId")String goodId, @PathVariable("userId") String userId) {
		System.out.println("goGood");

		Commodity commodity = service.getCommodity(goodId);

		model.addAttribute("good", commodity);
		return "shoppingCart";
		
	}

	//获得购物车内容
	@ResponseBody
	@RequestMapping("/getCart/{userId}")
	public Map<String, Object> getCart(@PathVariable("userId")String userId){
		System.out.println("getCart");
		Map<String, Object> map = new HashMap<>();

		List<Cart> list = cartService.getCartByUserId(userId);
		
		map.put("list",list);
		
		return map;
	}

	//结算页面
	@RequestMapping("/goOrder/{goodId}/{goodNum}")
	public String goOrder(Model model,@PathVariable("goodId")String goodId,@PathVariable("goodNum")String num) {
		System.out.println();
		
		Commodity commodity = service.getCommodity(goodId);
		
		model.addAttribute("good",commodity);
		model.addAttribute("goodNum", num);
		return "order";
	}

}
