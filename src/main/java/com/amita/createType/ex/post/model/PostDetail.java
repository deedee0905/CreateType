package com.amita.createType.ex.post.model;

import java.util.List;

import com.amita.createType.ex.post.comment.model.CommentDetail;
import com.amita.createType.ex.user.model.User;

public class PostDetail {
	
	private Post post;
	private User user;
	private List<CommentDetail> commentList;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}

	
}
