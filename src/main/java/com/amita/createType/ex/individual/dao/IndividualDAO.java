package com.amita.createType.ex.individual.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.post.like.model.Like;
import com.amita.createType.ex.post.model.Post;




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
	
	// 채널id 기반으로 정보 가져오기
	public Channel selectChannelInfoByChannelId(@Param("id") int id);
	
	// 채널 구독자 수 count
	public int selectScriberCount(@Param("channelId") int channelId);
	
	// 채널 main/view 페이지에서 발행된 포스트의 List를 가져오기
	public List<Post> selectPostList(@Param("channelId") int channelId);
	
	// 보관함 view 페이지에서 로그인한 사용자가 좋아요 체크한 게시물 List 가져오기
	public List<Like> selectPostListByLike(@Param("userId") int userId);
	

	

}
