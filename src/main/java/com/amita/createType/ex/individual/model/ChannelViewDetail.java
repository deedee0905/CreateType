package com.amita.createType.ex.individual.model;

import com.amita.createType.ex.post.model.Post;

public class ChannelViewDetail {
	
	private Post post;
	private int likeCount;
	private int viewCount;
	
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

}
