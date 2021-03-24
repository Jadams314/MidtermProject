package com.skilldistillery.agora.dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Product;
import com.skilldistillery.agora.entities.User;

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


	@Override
	public void addProduct(User user, Product product) {
		product.setSeller(user);
		product.setCreationDate(LocalDateTime.now());
		em.persist(product);
		
	}

}
