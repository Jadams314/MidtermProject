package com.skilldistillery.agora.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.agora.dao.InventoryDAO;

@Controller
public class ProductController {
	
	@Autowired
	private InventoryDAO dao;
	
	@RequestMapping(path = "inventory.do", method = RequestMethod.GET)
	public ModelAndView inventoryList() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("inventory", dao.getAllInventory());
		mv.setViewName("views/inventory");
		return mv;
	}
	
	
}
