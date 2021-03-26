package com.skilldistillery.agora.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.agora.dao.InventoryDAO;
import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

@Controller
public class ProductController {

	/*
	 * The product controller is used to get information from both the product table
	 * and the inventory table. Both tables use the same dao.
	 */

	@Autowired
	private InventoryDAO dao;

	// Retrieves a list of all the inventory that is set to available = true
	@RequestMapping(path = "inventory.do")
	public String inventoryList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			List<Inventory> inventory = dao.getAllInventoryAsList();
			model.addAttribute("inventory", inventory);
			return "views/inventory";
		}
		return "index";
	}

	// simple nav controller to get the user to the addProduct jsp
	@RequestMapping(path = "addProduct.do")
	public String addProduct(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "views/addProduct";
		}
		return "index";

	}

	/*
	 * Pulling product information from the form and building the product object
	 * then sending the object to the impl to be persisted.
	 */
	@RequestMapping(path = "registerproduct.do")
	public String registerProduct(Model model, HttpSession session, Product product) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			dao.addProduct(user, product);
			return "views/product";
		}
		return "index";
	}

	/*
	 * When a user wants to sell an item from their product table the list button
	 * will come here and get the product information and send it to impl to build
	 * an inventory object and persist it to the inventory table with is available
	 * set to true.
	 */
	@RequestMapping(path = "addProductInventory.do")
	public String addToInventory(Model model, HttpSession session, int id) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Product product = dao.findProduct(id);
			dao.addToInventory(user, product);
			session.setAttribute("user", user);
			return "redirect:home.do";
		}
		return "index";
	}

	/*
	 * If a seller desides they no longer want their inventory item to be available
	 * they well be sent here and is available will be sent to false. The product will still show on their
	 * product table incase they decide to relist the item.
	 */
	@RequestMapping(path = "notAvail.do")
	public String removeFromInventory(Model model, HttpSession session, int id) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Product product = dao.findProduct(id);
			List<Inventory> list = dao.getAllInventoryAsList();
			for (Inventory inventory : list) {
				if (inventory.getProduct().getId() == id) {
					Inventory item = inventory;
					dao.removeFromInventory(user, item);
				}
			}
			return "redirect:home.do";
		}
		return "index";

	}
}
