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
	
	

}
