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

	// simple controller to get a list of all products on the product table
	@RequestMapping(path = "findAllProd.do")
	public String Allproducts(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Product> products = search.findAll();
			model.addAttribute("displayAll", products);
			return "views/productList";
		}
		return "index";
	}

	// controller finds only the product with the id requested
	@RequestMapping(path = "findProdById.do")
	public String findProdById(int pid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Product product = search.findById(pid);
			model.addAttribute("product", product);
			return "views/product";
		}
		return "index";

	}

	// finds a list of product based on a keyword search
	@RequestMapping(path = "findProdByKW.do")
	public String findProdByKW(String keywordSearch, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Product> products = search.findProductByKeyword(keywordSearch);
			model.addAttribute("keywordSearch", products);
			return "views/KWproductList";
		}
		return "index";
	}
	//nav controller to go to a product information page
	@RequestMapping(path = "displayProduct.do")
	public String displayProduct(int pid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Product product = search.findById(pid);
			model.addAttribute("product", product);
			return "views/product";
		}
		return "index";
	}
}