package com.skilldistillery.agora.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "shoping_cart")
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

	
	/*
	 * ***** METHODS ******
	 */
	
	public ShoppingCart() {
		super();
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
