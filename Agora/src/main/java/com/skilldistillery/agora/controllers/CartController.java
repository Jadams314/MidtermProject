package com.skilldistillery.agora.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.agora.dao.CartDAO;
import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Purchase;
import com.skilldistillery.agora.entities.ShoppingCart;
import com.skilldistillery.agora.entities.User;

@Controller
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	@RequestMapping(path= "viewCart.do")
	public String viewCart(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			ShoppingCart cart = dao.getShoppingCart(user);
			List<Purchase> list	= cart.getPurchases();
			List<Inventory> items = new ArrayList<>();
			
			for (Purchase purchase : list) {
				items.add(purchase.getInventory());
			}
			model.addAttribute("cart", items);
			return "views/shoppingCart";
		} else {
			return "index";
		}

	}
	
	@RequestMapping(path= "addToCart.do")
	public String addToCart(HttpSession session, Inventory item, Model model) {
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			dao.addToCart(user, item);
			ShoppingCart cart = dao.getShoppingCart(user);
			List<Purchase> list	= cart.getPurchases();
			List<Inventory> items = new ArrayList<>();
			
			for (Purchase purchase : list) {
				items.add(purchase.getInventory());
			}
			model.addAttribute("cart", items);
			return "views/shoppingCart";
		}else {
			return "index";
		}
		
	}
	@RequestMapping(path= "removeFromCart.do")
	public String removeFromCart(HttpSession session, Inventory item) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			dao.removeFromCart(user, item);
			return "views/shoppingCart";
		}
		return "index";
	}
}