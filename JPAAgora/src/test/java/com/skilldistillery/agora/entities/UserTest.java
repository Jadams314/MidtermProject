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
import org.junit.jupiter.api.Disabled;
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

//	@Disabled
	@Test
	@DisplayName("Test user entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
		assertTrue(user.isEnabled());
		assertEquals("admin", user.getRole());
		assertEquals("adminemail@email.com", user.getEmail());
		assertEquals("Bob", user.getFirstName());
		assertEquals("Dole", user.getLastName());
		assertEquals(1, user.getAddress().getId());
		
		
	}
//	@Disabled
	@Test
	@DisplayName("Test user address mapping")
	void test2() {
		assertEquals("4 Elm", user.getAddress().getStreet());

	}
	

}
