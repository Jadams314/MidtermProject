package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.ShoppingCart;

public interface CartDAO {
	
	List<ShoppingCart> getShoppingCarts(int userId);

}
