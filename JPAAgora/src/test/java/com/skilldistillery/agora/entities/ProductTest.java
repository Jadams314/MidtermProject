package com.skilldistillery.agora.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ProductTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Product product;

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
		product = em.find(Product.class, 1);

	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		product = null;
	}

	@Test
	@DisplayName("Test Product entity mapping")
	void test1() {
		assertNotNull(product);
		assertNotNull(product.getName());
		assertNotNull(product.getDescription());
		assertEquals("Mask product", product.getName());
		assertEquals("Face mask in Product", product.getDescription());
		assertEquals(5.0, product.getPrice());
		LocalDateTime createDate = product.getCreationDate();
		assertEquals(2020, createDate.getYear());
		assertEquals(03, createDate.getMonthValue());
	}
	
	@Test
	@DisplayName("Test Product entity mapping to User")
	void test2() {
		assertNotNull(product);
		assertEquals(1, product.getSeller().getId());
	}
	@Test
	@DisplayName("Test Product entity mapping to inventory")
	void test3() {
		assertNotNull(product);
		assertTrue(product.getInventory().size() > 0);
		assertEquals(1, product.getInventory().get(0).getId());
		assertEquals("Mask Inventory", product.getInventory().get(0).getName());
	}
}
