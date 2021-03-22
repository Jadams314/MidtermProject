package com.skilldistillery.agora.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.entities.Product;

@Controller
public class SearchController {
	
	private SearchDao search;
	
//	@RequestMapping(path = { "/", "home.do" })
//	public String home(Model model) {
//		model.addAttribute("TEST", search.findById(1));
//		return "index";
//}

	@RequestMapping(path= "findAllProd.do")
	public String Allproducts(Model model) {
		List<Product> products = search.findAll();
		model.addAttribute("productList", products);
		return "index";
	}
	@RequestMapping(path= "findProdById.do")
	public String findProdById(@RequestParam ("pid") Integer pid, Model model) {
		Product product = search.findById(pid);
		model.addAttribute("product", product);
		return "product";
	
	}
	@RequestMapping(path= "findProdByKW.do")
	public String findProdByKW(@RequestParam ("keyword") String keyword, Model model) {
		List<Product> products = search.findProductByKeyword(keyword);
		model.addAttribute("product", products);
		return "products";
	
	}
}