package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

public interface InventoryDAO {
	
	public List<Object[]> getAllInventory();
	public void addProduct(User user, Product product);
	public void addToInventory(User user, Product product);
	public Product findProduct(int id);
	void removeFromInventory(User user, Inventory item);
	Inventory findItem(int id);
	List<Inventory> getAllInventoryAsList();
}
