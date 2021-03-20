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

class ProductCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	ProductComment comment;

	
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
		comment = em.find(ProductComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		comment = null;
	}


	@Test
	@DisplayName("Testing ProductComment entity")
	void test1() {
		assertNotNull(comment);
		assertNotNull(comment.getContent());
		assertEquals(2020, comment.getCreateDate().getYear());
		
	}

	@Test
	@DisplayName("Testing comment ManyToOne User mapping")
	void test2() {
		assertNotNull(comment);
		assertNotNull(comment.getUser());
		assertEquals("Bob" ,comment.getUser().getFirstName());
		assertEquals("admin" ,comment.getUser().getUsername());
			
	}
	
}
