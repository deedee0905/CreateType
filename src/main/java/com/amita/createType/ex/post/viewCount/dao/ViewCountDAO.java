package com.amita.createType.ex.post.viewCount.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ViewCountDAO {

	// 조회수 insert
	public int insertViewCount(@Param("postId") int postId);
	
	// 조회수 select
	public int selectViewCount(@Param("postId") int postId);
	
	// 게시글이 삭제되면서 조회수 삭제 시키기
	public int deleteViewCountByPostId(@Param("postId") int postId);
	
}
