package com.amita.createType.ex.commision.bookmark.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookmarkDAO {
	
	// 커미션 포스트에 북마크 insert
	public int insertBookmark(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("channelId") int channelId
			);
	
	// 커미션 포스트에 북마크 delete
	public int deleteBookmark(
			@Param("userId") int userId
			, @Param("postId") int postId
			, @Param("channelId") int channelId
			);
	

}
