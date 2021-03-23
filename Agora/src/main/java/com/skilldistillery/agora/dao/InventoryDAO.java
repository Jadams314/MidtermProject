package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.Inventory;

public interface InventoryDAO {
	
	public List<Object[]> getAllInventory();
}
