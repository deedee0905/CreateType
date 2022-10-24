package com.amita.createType.ex.post.subscription.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.post.subscription.model.Subscription;

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
	
	// 구독한 채널 리스트 가져오기
		public List<Subscription> selectSubscription(@Param("userId") int userId);
	
	// 로그인한 userId 기반으로 구독한 채널의 숫자 count
		public int selectCountChannelScription(@Param("userId") int userId);	

}
