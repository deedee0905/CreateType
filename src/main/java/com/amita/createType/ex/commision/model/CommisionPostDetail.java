package com.amita.createType.ex.commision.model;

import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.user.model.User;

public class CommisionPostDetail {
	
	private CommisionPost commisionPost;
	private User user;
	private Channel channel;
	
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	public CommisionPost getCommisionPost() {
		return commisionPost;
	}
	public void setCommisionPost(CommisionPost commisionPost) {
		this.commisionPost = commisionPost;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	

}
