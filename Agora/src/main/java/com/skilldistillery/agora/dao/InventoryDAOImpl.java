package com.skilldistillery.agora.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.Inventory;

@Service
@Transactional
public class InventoryDAOImpl implements InventoryDAO {

	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public List<Object[]> getAllInventory() {
		String query = "SELECT i FROM Inventory i";
		
		List<Object[]> results = em.createQuery(query, Object[].class)
				.getResultList();
		
		return results;
		
	}

}
