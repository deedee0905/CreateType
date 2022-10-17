package com.amita.createType.ex.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.dao.CommentDAO;
import com.amita.createType.ex.post.comment.model.Comment;
import com.amita.createType.ex.post.comment.model.CommentDetail;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;


@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;

	
	// 덧글 입력
	public int addComment(int userId, int postId, String comment) {
		return commentDAO.insertComment(userId, postId, comment);
	}
	
	// 덧글 조회
	public List<CommentDetail> getCommentList(int postId){
	
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment : commentList) {
			
			User user = userBO.getUserInfo(comment.getUserId());
			
			CommentDetail commentDetail = new CommentDetail();
			commentDetail.setComment(comment);
			commentDetail.setUser(user);
			
			commentDetailList.add(commentDetail);
		}
		
		return commentDetailList;
	}
	
	// 덧글 삭제
	public int deleteComment(int userId, int id) {
		return commentDAO.deleteComment(userId, id);
	}
	
	
}
