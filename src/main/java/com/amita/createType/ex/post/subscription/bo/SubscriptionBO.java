package com.amita.createType.ex.post.subscription.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.subscription.dao.SubscriptionDAO;

@Service
public class SubscriptionBO {
	
	@Autowired
	private SubscriptionDAO subscriptionDAO;
	
	// 구독 insert api
	public int addSubscription(int userId, int channelId) {
		return subscriptionDAO.insertSubscription(userId, channelId);
	}
	
	// 구독 delete api
		public int cancelSubscription(int userId, int channelId) {
			return subscriptionDAO.deleteSubscription(userId, channelId);
		}
	

}
