package com.skilldistillery.agora.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.Address;
import com.skilldistillery.agora.entities.User;

@Service
@Transactional
public class UserDaoJpaImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	/*
	 * Login will query for the user in the db and check that their password matches
	 * whats in the db. If the check comes back with out a matching wername and password the 
	 * user is set to null and TODO the user is sent back to the index page to try again... TODO need the pop up
	 */
	
	@Override
	public User login(User user) {

		String query = "SELECT u from User u WHERE u.username LIKE :username";

		List<User> results = em.createQuery(query, User.class).setParameter("username", user.getUsername())
				.getResultList();

		if (results.size() > 0 && results.get(0).getPassword().equals(user.getPassword())) {

			user = results.get(0);
		} else {
			System.out.println("************ TRY AGAIN SUCKKA");
			user = null;
		}

		return user;
	}

	/*
	 * registerAccount will take the user information and their address submitted
	 * from the registration.jsp form and persist both the address and user to the
	 * db.
	 */

	@Override
	public User registerAccount(User user, Address address) {
		user.setAddress(address);
		em.persist(user);
		return user;
	}

	@Override
	public Address createAddress(String street, String city, String state, String zipCode) {
		Address addr = new Address();

		addr.setId(5);
		addr.setStreet(street);
		addr.setCity(city);
		addr.setState(state);
		addr.setZipCode(zipCode);
		em.persist(addr);

		return addr;
	}

}
