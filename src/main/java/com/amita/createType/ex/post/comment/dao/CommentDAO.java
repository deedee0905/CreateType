package com.amita.createType.ex.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	// 덧글 입력
	public int insertComment(
		@Param("userId") int userId
		,@Param("postId") int postId
		, @Param("comment") String comment);
	
	
	// 덧글 리스트 select
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	// 덧글 삭제
	public int deleteComment(
			@Param("userId") int userId
			,@Param("id") int id
			);
	
	// 덧글수 count
	public int selectCommentCount(@Param("postId") int postId);
	
}
