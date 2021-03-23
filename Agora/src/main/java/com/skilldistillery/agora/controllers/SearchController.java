package com.skilldistillery.agora.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.entities.Product;

@Controller
public class SearchController {
	
	@Autowired
	private SearchDao search;
	
	@RequestMapping(path= "findAllProd.do")
	public String Allproducts(Model model) {
		List<Product> products = search.findAll();
		model.addAttribute("displayAll", products);
		return "views/product";
	}
	@RequestMapping(path= "findProdById.do")
	public String findProdById(int pid, Model model) {
		Product product = search.findById(pid);
		model.addAttribute("product", product);
		return "views/product";
	
	}
	@RequestMapping(path= "findProdByKW.do")
	public String findProdByKW(String keywordSearch, Model model) {
		List<Product> products = search.findProductByKeyword(keywordSearch);
		model.addAttribute("keywordSearch", products);
		return "views/product";
	
	}
}