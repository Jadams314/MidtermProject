package com.skilldistillery.agora.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.agora.dao.UserDAO;
import com.skilldistillery.agora.entities.Address;
import com.skilldistillery.agora.entities.User;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("TEST", userDao.findById(1));
		return "index";
	}

	
	// Simple nav controller to take the user to the registration form
	@RequestMapping(path = "register.do")
	public String registerPage(Model model) {
		return "views/register";
	}

	@RequestMapping(path = "login.do", params = { "username", "password" })
	public String login(User user, HttpSession session) {

		session.removeAttribute("user");
		user = userDao.login(user);

		if (user != null) {
			session.setAttribute("user", user);
			return "views/profile";
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
	 * 
	 * TODO create a pop up for a good register
	 */

	@RequestMapping(path = "registerAccount.do", params = { "firstName", "lastName", "username", "password", "email",
			"street", "city", "state", "zipCode" })
	public String registerAccount(User user, Address address, HttpSession session) {
		// User user = null;
		System.out.println("***********************" + user);
		if (session.getAttribute("user") != null) {
			return "views/profile";
		} else {
			user = userDao.registerAccount(user, address);
			if (user == null) {
				System.out.println("****************** Failed to insert new user");
				return "views/register";
			}

			return "views/profile";
		}

	}

}
