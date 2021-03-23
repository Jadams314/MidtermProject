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

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	private User user2;

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

		user = em.find(User.class, 2);

		user = em.find(User.class, 2 );
		user2 = em.find(User.class, 1);
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
		user2 = null;
	}

	@Test
	@DisplayName("Test User entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("testuser", user.getUsername());
		assertEquals("testuser", user.getPassword());
		assertTrue(user.isEnabled());
		assertEquals("admin", user.getRole());
		assertEquals("test@email.com", user.getEmail());
		assertEquals("tes1", user.getFirstName());
		assertEquals("test2", user.getLastName());
		assertNotNull(user.getAddress());
		
		
	}


	@Test
	@DisplayName("Test User entity mapping to Product")
	void test3() {
		assertNotNull(user);
		assertEquals("test product", user.getProducts().get(0).getName());
		assertTrue(user.getProducts().size() > 0);
	}

	@Test
	@DisplayName("Testing User OneToMany product comment mapping")
	void test4() {
		assertNotNull(user2);
		assertNotNull(user2.getProductComments());
		assertEquals("A comment",user2.getProductComments().get(0).getContent());

	}

//	@Disabled
	@Test
	@DisplayName("Test user address mapping")
	void test5() {
		assertEquals("teststreet", user.getAddress().getStreet());
		assertNotNull(user.getShoppingCarts());
		assertEquals(2020, user.getShoppingCarts().get(0).getCreateDate().getYear());
		assertFalse(user.getShoppingCarts().get(0).isPurchased());
	}
	
//	@Disabled //only works with user 2 atm 
	@Test
	@DisplayName("Test user address mapping")
	void test6() {
		assertEquals("teststreet", user.getAddress().getStreet());
	

	}
	@Test
	@DisplayName("Testing User OneToMany shopping carts mapping")
	void test7() {
		assertNotNull(user);
		assertNotNull(user.getShoppingCarts());
		assertEquals(1,user.getShoppingCarts().get(0).getId());

	}
	
}
