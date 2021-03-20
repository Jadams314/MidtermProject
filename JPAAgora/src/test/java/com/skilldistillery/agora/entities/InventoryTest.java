package com.skilldistillery.agora.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class InventoryTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	Inventory item;
	Inventory item2;

	
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
		item = em.find(Inventory.class, 1);
		item2 = em.find(Inventory.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		item = null;
		item2 = null;
	}


	@Test
	@DisplayName("Testing inventory entity")
	void test1() {
		assertNotNull(item);
		assertEquals(3.99, item.getPrice());
		assertEquals("Mask Inventory", item.getName());
		
	}

	@Test
	@DisplayName("Testing inventory entity mapped to product")
	void test2() {
		assertNotNull(item);
		assertEquals("Mask product", item.getProduct().getName());
		assertEquals(1, item.getProduct().getId());
		assertEquals(5,item.getProduct().getPrice());
	}
	
	@Test
	@DisplayName("Testing inventory to purchase mapping")
	void test3() {
		assertNotNull(item2);
		assertNotNull(item2.getPurchase());
		assertEquals(4 ,item2.getPurchase().get(0).getRating());
	}
}
