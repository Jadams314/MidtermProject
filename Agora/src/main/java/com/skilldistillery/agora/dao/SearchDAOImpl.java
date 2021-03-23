package com.skilldistillery.agora.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.agora.entities.Product;

@Service
@Transactional
public class SearchDAOImpl implements SearchDao {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Product findById(int id) {
		return em.find(Product.class, id);
		}

	@Override
	public List<Product> findAll() {
		String jpql = "SELECT p FROM Product p";
		return em.createQuery(jpql, Product.class).getResultList();
	}

	@Override
	public List<Product> findProductByKeyword(String keyword) {
//		
//		select e from Employee e where lower(e.firstName) like lower(concat('%', :search, '%')) " +
//		"or lower(e.lastName) like lower(concat('%', :search, '%'))")

		String jpql = "SELECT p from Product p WHERE p.name LIKE :keyword OR p.description LIKE :keyword";
		List<Object>results = em.createQuery(jpql, Object.class).setParameter("keyword","%" + keyword+ "%").getResultList();
			System.out.println("***********************************"+results);
			List<Product>list = new ArrayList<>();

			results.stream().forEach(x -> list.add((Product)x));
			
		return list;
	}
}
