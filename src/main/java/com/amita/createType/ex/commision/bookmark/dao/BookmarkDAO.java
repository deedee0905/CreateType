package com.amita.createType.ex.commision.bookmark.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.commision.bookmark.model.Bookmark;

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
	
	// 커미션 포스트에 북마크 여부 판별하는 기능
	public int bookmarkDiscrimination(
			@Param("userId") int userId
			, @Param("postId") int postId
			);
	
	// 북마크한 커미션 post를 userId 값으로 읽어오기
		public List<Bookmark> selectBookmarkList(@Param("userId") int userId);

}
