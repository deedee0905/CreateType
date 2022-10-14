package com.amita.createType.ex.individual.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.model.Channel;




@Repository
public interface IndividualDAO {
	
	// 채널 생성
	public int insertChannel (
			@Param("channelName") String channelName
			,@Param("channelInfo") String channelInfo
			,@Param("channelImagePath") String channelImagePath
			,@Param("userId") int userId);
	
	
	// 개인 프로필 상태 변경
	public int updatePrivateProfile(
			@Param("id") int id
			, @Param("nickname") String nickname
			, @Param("profileImagePath") String profileImagePath
			);
	
	// 채널 프로필 업데이트 api
	public int updateChannelProfile(
			@Param("id") int id
			, @Param("channelName") String channelName
			, @Param("channelInfo") String channelInfo
			, @Param("profileImagePath") String profileImagePath
			);
	
	// 채널 정보 가져오기
	public Channel selectChannelInfo(@Param("id") int id);
	
	// 구독 insert api
	public int insertSubscription(
			@Param("userId") int userId
			, @Param("channelId") int channelId
			);
	
	// 구독 delete api
	public int deleteSubscription(
			@Param("userId") int userId
			, @Param("channelId") int channelId
			);
	
	
	

}
