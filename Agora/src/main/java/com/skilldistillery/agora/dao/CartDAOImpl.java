package com.skilldistillery.agora.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.Inventory;
import com.skilldistillery.agora.entities.Purchase;
import com.skilldistillery.agora.entities.ShoppingCart;
import com.skilldistillery.agora.entities.User;

@Service
@Transactional
public class CartDAOImpl implements CartDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public ShoppingCart getShoppingCart(User user) {
		ShoppingCart sc = null;
		
		String query = "SELECT s from ShoppingCart s WHERE s.user.id = :userId AND s.isPurchased != true";
		List<ShoppingCart> shoppingCarts = em.createQuery(query, ShoppingCart.class).setParameter("userId", user.getId()).getResultList();
		
		if (shoppingCarts.size() > 0) {
			sc = shoppingCarts.get(0);
		}else {
			sc = new ShoppingCart();
			sc.setCheckoutDate(LocalDateTime.now());
			sc.setPurchases(new ArrayList<>());
			sc.setPurchased(false);
			sc.setUser(user);
			em.persist(sc);
		}
		
		return sc;
	
	}

	@Override
	public void addToCart(User user, Inventory item) {
		Purchase purchase = new Purchase();
		purchase.setInventory(item);
		ShoppingCart sc = getShoppingCart(user);
		sc.addPurchase(purchase);
		em.persist(purchase);
		em.persist(sc);
		
	}

	@Override
	public void removeFromCart(User user, Inventory item) {
		ShoppingCart sc = getShoppingCart(user);
		sc.getPurchases().remove(item);
		em.persist(sc);
		
	}

}
