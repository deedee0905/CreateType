package com.amita.createType.ex.post.subscription.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.subscription.dao.SubscriptionDAO;
import com.amita.createType.ex.post.subscription.model.Subscription;

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

	// 구독 중복여부 판별
	public int duplicateSubscription(int userId, int channelId) {
		return subscriptionDAO.selectDuplicate(userId, channelId);
	}
	
	// 채널 리스트 가져오기
	public List<Subscription> getSubscriptionList(int userId){
		return subscriptionDAO.selectSubscription(userId);
	}
		

}
