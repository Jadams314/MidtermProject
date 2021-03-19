package com.skilldistillery.agora.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Purchase {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	@Column(name="inventory_id")
	private int inventoryId;
	
	private int rating;
	
	private String review;
	
	@Column(name="buyer_id")
	private int buyerId;
	
	@Column(name="purchase_date")
	private LocalDateTime purchaseDate;
	
	@OneToMany(mappedBy="purchase")
	@Column(name="shopping_cart")
	private List<ShoppingCart> shoppingCart;
	//TODO: Add and remove methods?
	
	//Constructors
	public Purchase() {}

	//Methods
	public List<ShoppingCart> getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(List<ShoppingCart> shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}

	public LocalDateTime getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(LocalDateTime purchaseDate) {
		this.purchaseDate = purchaseDate;
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
		Purchase other = (Purchase) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Purchase [id=").append(id).append(", inventoryId=").append(inventoryId).append(", rating=")
				.append(rating).append(", review=").append(review).append(", buyerId=").append(buyerId)
				.append(", purchaseDate=").append(purchaseDate).append("]");
		return builder.toString();
	}
	
	
	

}
