package com.amita.createType.ex.commision.bookmark.model;

import java.util.Date;

public class Bookmark {

	private int id;
	private int userId;
	private int commisionPostId;
	private int channelId;
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
	public int getCommisionPostId() {
		return commisionPostId;
	}
	public void setCommisionPostId(int commisionPostId) {
		this.commisionPostId = commisionPostId;
	}
	public int getChannelId() {
		return channelId;
	}
	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
