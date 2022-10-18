package com.amita.createType.ex.individual.model;

import com.amita.createType.ex.post.like.model.Like;
import com.amita.createType.ex.post.model.Post;

public class LibraryDetail {
	
	private Like like;
	private Post post;
	private int likeCount;
	private int viewCount;
	
	
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

}
