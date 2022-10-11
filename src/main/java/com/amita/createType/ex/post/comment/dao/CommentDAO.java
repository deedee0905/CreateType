package com.amita.createType.ex.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
		@Param("userId") int userId
		,@Param("postId") int postId
		, @Param("comment") String comment);
	
	
	public Comment selectCommentList(@Param("postId") int postId);
	
}
