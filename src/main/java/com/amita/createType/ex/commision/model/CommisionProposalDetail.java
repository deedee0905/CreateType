package com.amita.createType.ex.commision.model;

import com.amita.createType.ex.user.model.User;

public class CommisionProposalDetail {
	
	private CommisionProposal commisionProposal;
	private CommisionPost commisionPost;
	private User user;
	
	
	public CommisionProposal getCommisionProposal() {
		return commisionProposal;
	}
	public void setCommisionProposal(CommisionProposal commisionProposal) {
		this.commisionProposal = commisionProposal;
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
