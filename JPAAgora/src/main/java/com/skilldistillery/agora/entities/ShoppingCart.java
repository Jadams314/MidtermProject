package com.skilldistillery.agora.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "shopping_cart")
public class ShoppingCart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "is_purchased")
	private boolean isPurchased;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "checkout_date")
	private LocalDateTime checkoutDate;
	
	@OneToMany(mappedBy="shoppingCart")
	private List<Purchase> purchases;	

	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	//Constructors
	public ShoppingCart() {
		super();
	}
	
	/*
	 * ***** METHODS ******
	 */	


	public List<Purchase> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public boolean isPurchased() {
		return isPurchased;
	}


	public void setPurchased(boolean isPurchased) {
		this.isPurchased = isPurchased;
	}


	public LocalDateTime getCreateDate() {
		return createDate;
	}


	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}


	public LocalDateTime getCheckoutDate() {
		return checkoutDate;
	}


	public void setCheckoutDate(LocalDateTime checkoutDate) {
		this.checkoutDate = checkoutDate;
	}
	
	
	public void addPurchase(Purchase purchase) {
		if (purchases == null) purchases = new ArrayList<>();
		
		if (!purchases.contains(purchase)) {
			purchases.add(purchase);
		}
		purchase.setShoppingCart(this);
	}
	
	public void removePurchase(Purchase purchase) {
		purchase.setShoppingCart(null);
		
		if (purchases != null) {
			purchases.remove(purchase);
		}
	}
	


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingCart other = (ShoppingCart) obj;
		if (id != other.id)
			return false;
		return true;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShoppingCart [id=").append(id).append(", isPurchased=").append(isPurchased)
				.append(", createDate=").append(createDate).append(", checkoutDate=").append(checkoutDate).append("]");
		return builder.toString();
	}
	
	
	
}
