package com.amita.createType.ex.post.viewCount.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ViewCountDAO {

	public int insertViewCount(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
	
	
}
