package com.skilldistillery.agora.dao;

import com.skilldistillery.agora.entities.User;

public interface UserDAO {

	User findById(int userId);
	User login (String username, String password);
	
}
