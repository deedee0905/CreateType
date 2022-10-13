package com.amita.createType.ex.individual.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;




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
	
	

}
