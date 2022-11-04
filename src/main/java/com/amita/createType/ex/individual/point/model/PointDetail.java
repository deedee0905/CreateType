package com.amita.createType.ex.individual.point.model;

import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.user.model.User;

public class PointDetail {
	
	private Point point;
	private Post post;
	private User user;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Point getPoint() {
		return point;
	}
	public void setPoint(Point point) {
		this.point = point;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	

}
