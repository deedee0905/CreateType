package com.amita.createType.ex.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.dao.CommentDAO;
import com.amita.createType.ex.post.comment.model.Comment;


@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	

	
	// 덧글 입력
	public int addComment(int userId, int postId, String comment) {
		return commentDAO.insertComment(userId, postId, comment);
	}
	
	// 덧글 조회
	public List<Comment> getCommentList(int postId){
	
		return commentDAO.selectCommentList(postId);
		
	}
	
	
}
