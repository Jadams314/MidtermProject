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

class UserTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 2 );
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("Test user entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("testuser", user.getUsername());
		assertEquals("testuser", user.getPassword());
		assertTrue(user.isEnabled());
		assertEquals("admin", user.getRole());
		assertEquals("test@email.com", user.getEmail());
		assertEquals("tes1", user.getFirstName());
		assertEquals("test2", user.getLastName());
		assertEquals(2, user.getAddressId());
		
		
	}
	
	@Test
	@DisplayName("Test OneToMany Mapping User To Purchased")
	void test2() {
		assertNotNull(user);
		assertTrue(user.getPurchases().size()>0);
		assertEquals("This mask is a test comment", 
				user.getPurchases().get(0).getReview());
		
	}

}
