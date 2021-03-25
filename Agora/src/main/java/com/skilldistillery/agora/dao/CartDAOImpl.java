package com.skilldistillery.agora.dao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.hibernate.type.DateType;
import org.hibernate.type.LocalDateType;
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
	public Inventory addToCart(User user, Inventory item) {
		item = em.find(Inventory.class, item.getId());
		Purchase purchase = new Purchase();
		purchase.setInventory(item);
		ShoppingCart sc = getShoppingCart(user);
		sc.addPurchase(purchase);
		em.persist(purchase);
		em.persist(sc);
		em.flush();
		
		return item;
	}

	@Override
	public Inventory removeFromCart(User user, Inventory item) {
		ShoppingCart sc = getShoppingCart(user);
		List<Purchase> purchase = sc.getPurchases();
		
		for (Purchase result : purchase) {
			if (result.getInventory().getId() == item.getId()) {
				em.remove(result);
				em.flush();
			}
		}
		return item;
	}
	
	public boolean checkCreditCardInfo(User user, String creditCard, String year, 
			String month, String firstName, String lastName, String zipCode) {
		int m = Integer.parseInt(month);
		int y = Integer.parseInt(year);
		int yearNow = LocalDateTime.now().getYear();
		
		//TEST CODE
//		System.out.println("****************************************************");
//		System.out.println("creditcard  " + creditCard);
//		System.out.println("year  " + year + "***" + y);
//		System.out.println("month  "+ month + "***" + m);
//		System.out.println("yearNow  " +yearNow);
//		System.out.println("firstName  " +firstName);
//		System.out.println("lastName  "+ lastName);
//		System.out.println("zipCode  "+zipCode);
//		System.out.println("****************************************************");
		
		if(user.getFirstName().equals(firstName) &&
		   user.getLastName().equals(lastName) &&
		   user.getAddress().getZipCode().equals(zipCode) &&
		   (creditCard.length() == 16) && 
		   ( m > 0 && m < 13) &&
		   (y > yearNow)) {
			
			return true;
		}else {
			return false;
		}
		
	}
	
	@Override
	public void removeFromInventory(User user, Inventory item) {
		item.setAvailable(false);
		em.persist(item);
	}

}
