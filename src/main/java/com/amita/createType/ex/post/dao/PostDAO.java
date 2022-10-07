package com.amita.createType.ex.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {
	
	public int insertNewPost(
			@Param("userId") int userId
			,@Param("channelId") int channelId
			,@Param("title") String title
			,@Param("subtitle") String subtitle
			,@Param("content") String content
			,@Param("category") int category
			,@Param("price") int price
			);
	

}
