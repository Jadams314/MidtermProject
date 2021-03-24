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
	
	
	/*
	 * In order to display items in the cart we must get a list of purchases from the cart
	 * which hold the items in inventory. Then iterate through the list of purchase and get 
	 * the item out and add it to a new list of Inventory items. Last we pass the list of inventory
	 * items to the jsp.
	 */
	
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
			} else {
				return "index";
			}
		
	}
	@RequestMapping(path= "removeFromCart.do")
	public String removeFromCart(HttpSession session, Inventory item, Model model) {
		User user = (User) session.getAttribute("user");
		if(user != null) {
			dao.removeFromCart(user, item);
			ShoppingCart cart = dao.getShoppingCart(user);
			List<Purchase> list	= cart.getPurchases();
			List<Inventory> items = new ArrayList<>();
			
			for (Purchase purchase : list) {
				items.add(purchase.getInventory());
			}
			model.addAttribute("cart", items);
			return "views/shoppingCart";
		}
		return "index";
	}
	
	
	
	
	
	@RequestMapping(path = "checkout.do")
	public String checkout(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		if(user != null) {
		double total = 0.0;
		int itemCount = 0;
		ShoppingCart cart = dao.getShoppingCart(user);
		
//		cart.setPurchased(true);

		List<Purchase> list	= cart.getPurchases();
		List<Inventory> items = new ArrayList<>();
		
		for (Purchase purchase : list) {
			purchase.getInventory().setAvailable(false);
			items.add(purchase.getInventory());
			total += purchase.getInventory().getPrice();
			itemCount ++;
		}

			//set model for list of paid for items
			model.addAttribute("paidfor", items);
			model.addAttribute("totalCost", total);
			model.addAttribute("count", itemCount);
			return "views/checkout";
		}
		//if user has no session return home
		else {
			return "index";
			
			}
	}
}