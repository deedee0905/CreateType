package com.amita.createType.ex.commision.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.commision.model.CommisionPost;

@Repository
public interface CommisionDAO {
	
	// 커미션 post insert
	public int insertCommisionPost(
			@Param("userId") int userId
			,@Param("channelId") int channelId
			,@Param("title") String title
			,@Param("content") String content
			,@Param("category") int category
			,@Param("minimumPrice") int minimumPrice
			,@Param("maximumPrice") int maximumPrice
			,@Param("deadline") int deadline
			,@Param("question") String question
			,@Param("thumbnail") String thumbnail
			);
	
	// 발행된 커미션 post 읽어오기
	public List<CommisionPost> selectCommisionCategory(@Param("category") int category);
	
	// commisionPost id 기반으로 포스트의 정보를 가져오기
	public CommisionPost selectCommisionPostInfoByPostId(@Param("id") int id);
	
	// channelView 에서 해당 채널의 사용자가 작성한 커미션 포스트 정보를 가져오기
	public List<CommisionPost> selectCommisionPost(@Param("channelId") int channelId);

}
