package com.skilldistillery.agora.dao;

import com.skilldistillery.agora.entities.Address;
import com.skilldistillery.agora.entities.User;

public interface UserDAO {

	User findById(int userId);
	User login (User user);
	Address createAddress(String street, String city, String state, String zipCode);
	User registerAccount(User user, Address address);
	
}
