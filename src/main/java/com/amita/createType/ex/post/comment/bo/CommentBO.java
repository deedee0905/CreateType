package com.amita.createType.ex.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.dao.CommentDAO;
import com.amita.createType.ex.post.comment.model.Comment;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	private UserBO userBO;
	
	// 덧글 입력
	public int addComment(int userId, int postId, String comment) {
		return commentDAO.insertComment(userId, postId, comment);
	}
	
	// 덧글 조회
	public List<CommentDetail> getCommentList(int postId){
	
		//덧글은 여러개가 저장될 수 있으므로 List
		List<Comment> commentList = commentDAO.selectPostList(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment : commentList) {
			
			User user = userBO.getUserById(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setComment(comment);
			commentDetail.setUser(user);
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
		
	}
	
	
}
