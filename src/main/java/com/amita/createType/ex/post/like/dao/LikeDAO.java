package com.amita.createType.ex.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	// 좋아요 insert api
	public int insertLike(@Param("userId") int userId, @Param("postId") int postId);

	// 좋아요 delete api
	public int deleteLike(@Param("userId") int userId, @Param("postId") int postId);
	
	// 특정 사용자가 좋아요 했는지 체크
	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId		
			);
	
	// 좋아요 count
	public int selectCountLike(@Param("postId") int postId);
	
}
