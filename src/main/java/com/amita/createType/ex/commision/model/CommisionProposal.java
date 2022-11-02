package com.amita.createType.ex.commision.model;

import java.util.Date;

public class CommisionProposal {
	
	private int id;
	private int userId;
	private int commisionPostId;
	private int postUserId;
	private String content;
	private String processing;
	private Date createdAt;
	private Date updatedAt;
	
	
	public String getProcessing() {
		return processing;
	}
	public void setProcessing(String processing) {
		this.processing = processing;
	}
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
	public int getPostUserId() {
		return postUserId;
	}
	public void setPostUserId(int postUserId) {
		this.postUserId = postUserId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	

}
