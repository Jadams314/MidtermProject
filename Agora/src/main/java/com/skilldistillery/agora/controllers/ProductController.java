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
}
