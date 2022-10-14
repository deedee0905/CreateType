package com.amita.createType.ex.post.subscription.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SubscriptionDAO {
	
	
	// 구독하기 api
	public int insertSubscription(
			@Param("userId") int userId
			, @Param("channelId") int channelId
			);

	// 구독 delete api
		public int deleteSubscription(
				@Param("userId") int userId
				, @Param("channelId") int channelId
				);
		
	// 구독 중복여부 판별
		public int selectDuplicate(
				@Param("userId") int userId
				, @Param("channelId") int channelId
				);
	

}
