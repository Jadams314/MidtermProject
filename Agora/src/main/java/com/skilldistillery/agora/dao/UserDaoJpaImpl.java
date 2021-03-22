package com.skilldistillery.agora.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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

	@Override
	public User login(String username, String password) {
	
		User user = null;
		
		String query = "SELECT u from User u WHERE u.username LIKE :username";
		
		List<User> results = em.createQuery(query, User.class)
		.setParameter("username", username)
		.getResultList();
		
		 if (results.get(0).getPassword().equals(password)) {
			user = results.get(0);
		}else {
			System.out.println("************ TRY AGAIN SUCKKA");
		}
		
		return user;
	}
	
	
	
	
	
//	 @Override
//	  public User getUserByUserNameAndPassword(String userName, String password) {
//	    User u = null;
//	    Set<Integer> keys = users.keySet();
//	    for (Integer key : keys) {
//	      User user = users.get(key);
//	      if(user.getUserName().equals(userName) && user.getPassword().equals(password)) {
//	        u = user;
//	        break;
//	      }
//	    }
//	    return u;
//	  }

}
