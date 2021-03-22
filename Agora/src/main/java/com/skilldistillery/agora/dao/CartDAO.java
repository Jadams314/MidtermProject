package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.ShoppingCart;

public interface CartDAO {
	
	List<ShoppingCart> getShoppingCart(int userId);
	
	void addToCart(int userId, int inventoryId);
	
	void removeFromCart(int userId, int inventoryId);

}
