package com.skilldistillery.agora.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.dao.UserDAO;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

@Controller
public class SearchController {

	@Autowired
	private SearchDao search;

	@RequestMapping(path = "findAllProd.do")
	public String Allproducts(Model model, HttpSession session) {
		List<Product> products = search.findAll();
		model.addAttribute("displayAll", products);
		User user = (User) session.getAttribute("user");

		if (user != null) {
			session.setAttribute("user", user);
			return "views/productList";
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "findProdById.do")
	public String findProdById(int pid, Model model, HttpSession session) {
		Product product = search.findById(pid);
		model.addAttribute("product", product);
		User user = (User) session.getAttribute("user");

		if (user != null) {
			session.setAttribute("user", user);
			return "views/product";
		} else {
			return "index";
		}

	}

	@RequestMapping(path = "findProdByKW.do")
	public String findProdByKW(String keywordSearch, Model model, HttpSession session) {
		List<Product> products = search.findProductByKeyword(keywordSearch);
		model.addAttribute("keywordSearch", products);
		User user = (User) session.getAttribute("user");

		if (user != null) {
			session.setAttribute("user", user);
			return "views/productList";
		} else {
			return "index";
		}
		}
		@RequestMapping(path = "displayProduct.do")
		public String displayProduct(int pid, Model model, HttpSession session) {
			Product product = search.findById(pid);
			model.addAttribute("product", product);
			User user = (User) session.getAttribute("user");
			
			if (user != null) {
				session.setAttribute("user", user);
				return "views/product";
			} else {
				return "index";
			}
	}
}