package com.skilldistillery.agora.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.agora.dao.InventoryDAO;
import com.skilldistillery.agora.dao.SearchDao;
import com.skilldistillery.agora.dao.UserDAO;
import com.skilldistillery.agora.entities.Address;
import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private InventoryDAO dao;
	@Autowired
	private SearchDao search;

	/*
	 * Main profile controller, dao's populate the the Product table and Inventory
	 * Table seen on the profile page. When traversing from page to page most links
	 * to go back will come back to this controller
	 */

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("firstName", user.getFirstName());
			List<Inventory> inventory = dao.getAllInventoryAsList();
			model.addAttribute("inventory", inventory);
			List<Product> products = search.findAll();
			model.addAttribute("products", products);
			return "views/profile";
		}

		return "index";
	}

	/*
	 * The path says it all. When a user wants to log out this controller will
	 * remove the session and send them back to the login page.
	 */

	@RequestMapping(path = "logout.do")
	public String logout(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			session.removeAttribute("user");
			return "index";
		}
		return "index";
	}

	// Nav controller to send user to user from the login to the register jsp
	@RequestMapping(path = "register.do")
	public String registerPage(Model model) {
		return "views/register";
	}

	/*
	 * The login controller checks with the dao to insure the user name and password 
	 * are identical to what we have stored in our user table on the db.
	 */
	@RequestMapping(path = "login.do", params = { "username", "password" })
	public String login(User user, HttpSession session) {

		session.removeAttribute("user");
		user = userDao.login(user);

		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:home.do";
		} else {
			return "index";
		}

	}

	/*
	 * When a user selects register an account from the homepage.jsp they will be
	 * sent to register.jsp. The form inside of register.jsp sends the information
	 * here. This will create the user and address objects and persist them into the
	 * agoradb. Once the user object is created and returns not null the user will
	 * be sent to the profile.jsp
	 */

	@RequestMapping(path = "registerAccount.do", params = { "firstName", "lastName", "username", "password", "email",
			"street", "city", "state", "zipCode" })
	public String registerAccount(User user, Address address, HttpSession session) {
		session.setAttribute("user", user);
		if (session.getAttribute("user") != null) {
			user = userDao.registerAccount(user, address);
			return "redirect:home.do";
		} else {
			if (user == null) {
				return "views/register";
			}
			return "redirect:home.do";
		}
	}

}
