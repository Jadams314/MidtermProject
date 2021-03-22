package com.skilldistillery.agora.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.ShoppingCart;

@Service
@Transactional
public class CartDAOImpl implements CartDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ShoppingCart> getShoppingCart(int userId) {
		
		String query = "SELECT s from ShoppingCart s WHERE s.userId = :userId";
		
		List<ShoppingCart> shoppingCart = em.createQuery(query, ShoppingCart.class).setParameter("userId", userId).getResultList();
		
		return shoppingCart;
	}

	@Override
	public void addToCart(int userId, int inventoryId) {
		
		
		
	}

	@Override
	public void removeFromCart(int userId, int inventoryId) {
		
		
		
	}

}
