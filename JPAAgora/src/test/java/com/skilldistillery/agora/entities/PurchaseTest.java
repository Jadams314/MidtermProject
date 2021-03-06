package com.skilldistillery.agora.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class PurchaseTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Purchase purchase;

	
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
		purchase = em.find(Purchase.class, 2 );
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		purchase = null;
	}

	
	@Test
	@DisplayName("Testing Address Entity with test data")
	void test1() {
		assertNotNull(purchase);
		assertEquals(4, purchase.getRating());
		assertEquals(2020, purchase.getPurchaseDate().getYear());
		assertEquals(3, purchase.getPurchaseDate().getMonthValue());
}


	@DisplayName("Testing OneToMany Mapping with ShoppigCart")
	void test2() {
		assertNotNull(purchase);
		assertNotNull(purchase.getShoppingCart());
		assertEquals(1, purchase.getShoppingCart().getId());
	} 
}
