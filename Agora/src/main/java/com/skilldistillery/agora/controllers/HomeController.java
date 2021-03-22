package com.skilldistillery.agora.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.agora.dao.UserDAO;
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
	@RequestMapping(path = "register.do")
	public String registerPage(Model model) {
		return "views/register";
	}

	@RequestMapping(path = "login.do", params = { "username", "password" })
	public String login(Model model, String username, String password, HttpSession session) {
		User user = null;
		
		//TODO check with instructors to see if we need to set session to null
		
		/*
		 * Session set to null so a failed login will not send to profile page.
		 * 
		 * 1) Make session null. 
		 * 2) find user name and password from dao 
		 * 3) set the session to the user
		 */
		
		
		session.setAttribute("user", null);
		
		if (session.getAttribute("user") !=null) {
			return "views/profile";
		}
		
		user = userDao.login(username, password);
		

		if (user != null){
			session.setAttribute("user", user);
			return "views/profile";
		}else {
			return "index";
		}

	}

}
