package com.amita.createType.ex.commision.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

}
