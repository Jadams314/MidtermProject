package com.skilldistillery.agora.dao;

import java.util.List;

import com.skilldistillery.agora.entities.Product;

public interface SearchDao {

	Product findById(int id);
	List<Product> findAll();
	List<Product> findProductByKeyword(String keyword);
//	may want find product by userid but may be redundant if we can see all products on user page

	
}
