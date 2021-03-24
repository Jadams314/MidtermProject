package com.skilldistillery.agora.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.agora.dao.InventoryDAO;
import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

@Controller
public class ProductController {
	
	@Autowired
	private InventoryDAO dao;

	@RequestMapping(path = "inventory.do")
	public String inventoryList(Model model, HttpSession session) {
		List<Object[]> inventory = dao.getAllInventory();
		model.addAttribute("inventory", inventory);
		User user = (User) session.getAttribute("user");

		if (user != null) {
			session.setAttribute("user", user);
			return "views/inventory";
		} else {
			return "index";
		}
	
	}
	@RequestMapping(path = "addProduct.do")
	public String addProduct(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			session.setAttribute("user", user);
			return "views/addProduct";
		} else {
			return "index";
		}
		
	}
	@RequestMapping(path = "registerproduct.do")
	public String registerProduct(Model model, HttpSession session, Product product) {
		User user = (User) session.getAttribute("user");
		dao.addProduct(user, product);
		if (user != null) {
			session.setAttribute("user", user);
			return "views/product";
		} else {
			return "index";
		}
		
	}
	@RequestMapping(path = "addProductInventory.do")
	public String addToInventory(Model model, HttpSession session, int id) {
		Product product = dao.findProduct(id);
		User user = (User) session.getAttribute("user");
		System.out.println("************* In CONTORLLER**************" + product);
		dao.addToInventory(user, product);
		if (user != null) {
			session.setAttribute("user", user);
			//TODO set up the return page
			return "views/profile";
		} else {
			return "index";
		}
		
	}
}
