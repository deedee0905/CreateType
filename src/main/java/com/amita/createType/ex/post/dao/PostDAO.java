package com.amita.createType.ex.post.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.model.Channel;
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
	
	// userId를 기반으로 발행된 포스트의 List를 가져오기
	public List<Post> selectPostListByUserId(@Param("userId") int userId);
	
	// 로그인한 userId를 기반으로 작성된 게시글의 갯수 count
	public int selectPostCount(@Param("userId") int userId);
	
	// 로그인한 userId를 기반으로 채널 정보를 가져오기
	public Channel selectChannelInfoByUserId(@Param("userId") int userId);
	
}
