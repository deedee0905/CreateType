package com.amita.createType.ex.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.post.model.Post;

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
	

	public List<Post> selectPost(@Param("id") int id);
	
	
}
