package com.skilldistillery.agora.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ShoppingCartTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ShoppingCart shoppingCart;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("Agora");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		shoppingCart = em.find(ShoppingCart.class, 1 );
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		shoppingCart = null;
	}

	@Test
	@DisplayName("Test Shopping Cart entity mapping")
	void test1() {
		assertNotNull(shoppingCart);
		assertFalse(shoppingCart.isPurchased());
		
		
	}


	@Test
	@DisplayName("Test Shopping Cart ManyToMany Mappings with Inventory")
	void test3() {
		assertNotNull(shoppingCart);
		assertTrue(shoppingCart.getPurchases().size()>0);
		assertEquals(1, shoppingCart.getPurchases().get(0).getInventory().getId());
	}

}
