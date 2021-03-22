package com.skilldistillery.agora.dao;

import java.util.LinkedList;
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

	
	public List<Product> findProductByKeyword(String keyword) {

		List<Product> matches = new LinkedList<>();

		String jpql = "SELECT p from Product p WHERE p.name LIKE :keyword";
			matches = em.createQuery(jpql, Product.class).setParameter("keyword", keyword).getResultList();


		return matches;
// 
	}
}
