package com.amita.createType.ex.post.viewCount.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ViewCountDAO {

	// 조회수 insert
	public int insertViewCount(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
	
	// 조회수 select
	public int selectViewCount(@Param("postId") int postId);
	
	
}
