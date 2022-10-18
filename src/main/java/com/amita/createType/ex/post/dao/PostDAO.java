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
			,@Param("thumbnail") String thumbnail
			,@Param("category") int category
			,@Param("price") int price
			);
	

	public Post selectPost(@Param("id") int id);
	
	public List<Post> selectCategory(@Param("category") int category);
	
	public Post updatePostSelect(@Param("id") int id);
	
	public int updatePost(
			@Param("userId") int userId
			,@Param("id") int id
			,@Param("title") String title
			, @Param("subtitle") String subtitle
			, @Param("content") String content
			, @Param("thumbnail") String thumbnail
			, @Param("category") int category
			, @Param("price") int price
			);
	
	public int deletePost(
			@Param("channelId") int channelId
			, @Param("id") int id
			);
	
	
	public Post selectPostListByPostId(@Param("id") int id);
	

	
}
