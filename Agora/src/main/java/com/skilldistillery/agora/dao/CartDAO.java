package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.ShoppingCart;
import com.skilldistillery.agora.entities.User;

public interface CartDAO {
	
	ShoppingCart getShoppingCart(User user);
	
	Inventory addToCart(User user, Inventory item);
	
	void removeFromCart(User user, Inventory item);


}
