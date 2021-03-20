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
		user = em.find(User.class, 1 );
				
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("Test User entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertTrue(user.isEnabled());
		assertEquals("admin", user.getRole());
		assertEquals("adminemail@email.com", user.getEmail());
		assertEquals("Bob", user.getFirstName());
		assertEquals("Dole", user.getLastName());
		assertEquals(1, user.getAddressId());
		
		
	}

	@Test
	@DisplayName("Test User entity mapping to Product")
	void test2() {
		assertNotNull(user);
		assertEquals("Mask product", user.getProducts().get(0).getName());
		assertTrue(user.getProducts().size() > 0);
	}
	
	@Test
	@DisplayName("Testing User OneToMany product comment manpping")
	void test3() {
		assertNotNull(user);
		assertNotNull(user.getComment());
		assertEquals("A comment",user.getComment().get(0).getContent());
		assertEquals(2020,user.getComment().get(0).getCreateDate().getYear());
	}
}
