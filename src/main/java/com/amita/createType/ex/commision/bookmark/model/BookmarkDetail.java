package com.amita.createType.ex.commision.bookmark.model;

import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.user.model.User;

public class BookmarkDetail {
	
	private Bookmark bookmark;
	private User user;
	private CommisionPost commisionPost;
	
	public Bookmark getBookmark() {
		return bookmark;
	}
	public void setBookmark(Bookmark bookmark) {
		this.bookmark = bookmark;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public CommisionPost getCommisionPost() {
		return commisionPost;
	}
	public void setCommisionPost(CommisionPost commisionPost) {
		this.commisionPost = commisionPost;
	}
	
	
	

}
