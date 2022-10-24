package com.amita.createType.ex.post.subscription.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.bo.IndividualBO;
import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.post.subscription.dao.SubscriptionDAO;
import com.amita.createType.ex.post.subscription.model.Subscription;
import com.amita.createType.ex.post.subscription.model.SubscriptionDetail;

@Service
public class SubscriptionBO {
	
	@Autowired
	private SubscriptionDAO subscriptionDAO;
	
	@Autowired
	private IndividualBO individualBO;
	
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
	
	// 구독한 채널 리스트 가져오기
	public List<SubscriptionDetail> getSubscriptionList(int userId){
		
		List<Subscription> subscriptionList = subscriptionDAO.selectSubscription(userId);
		
		List<SubscriptionDetail> subscriptionDetailList = new ArrayList<>();
		
		for(Subscription subscription : subscriptionList) {
			
			Channel channel = individualBO.getChannelInfo(subscription.getChannelId());
			
			SubscriptionDetail subscriptionDetail = new SubscriptionDetail();
			subscriptionDetail.setChannel(channel);
			subscriptionDetail.setSubscription(subscription);
			
			subscriptionDetailList.add(subscriptionDetail);
			
		}
		return subscriptionDetailList;
	}
	
	public int countChannelSubscription(int userId) {
		return subscriptionDAO.selectCountChannelScription(userId);
	}
	
	
		

}
