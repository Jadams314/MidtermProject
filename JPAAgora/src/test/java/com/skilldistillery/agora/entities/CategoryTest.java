package com.skilldistillery.agora.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
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

class CategoryTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Category category;

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
		category = em.find(Category.class, 1 );
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		category = null;
	}

	@Test
	@DisplayName("Test Category entity mapping")
	void test1() {
		assertNotNull(category);
		assertNotNull(category.getName());
		assertNotNull(category.getDescription());		
		assertEquals("Mask Category", category.getName());
		assertEquals("In Category - mask", category.getDescription());
	}

	@Test
	@DisplayName("Test Category ManyToMany Mappings to Product")
	void test2() {
		assertNotNull(category);
		assertTrue(category.getProducts().size()>0);
		assertNotNull(category.getProducts());
		assertTrue(category.getProducts().get(0).getPrice()>0);
	}

}
