package com.skilldistillery.agora.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="product_comment")
public class ProductComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	
	@Column(name="create_date")
	private LocalDateTime createDate;

	
	//has user_id foreign key

	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	
	//has product_id foreign key
	

	
	
/*
 * ***** METHODS ******
 */	
	
	public ProductComment() {}
	



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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
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
		ProductComment other = (ProductComment) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductComment id=");
		builder.append(id);
		builder.append(", content=");
		builder.append(content);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(".");
		return builder.toString();
	}
	
	
	
}
