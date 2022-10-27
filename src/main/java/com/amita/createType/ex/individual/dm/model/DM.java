package com.amita.createType.ex.individual.dm.model;

import java.util.Date;

public class DM {
	private int id;
	private int userId;
	private int userIdOthers;
	private String message;
	private Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserIdOthers() {
		return userIdOthers;
	}
	public void setUserIdOthers(int userIdOthers) {
		this.userIdOthers = userIdOthers;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	

}
