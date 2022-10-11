package com.amita.createType.ex.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.comment.model.CommentDetail;
import com.amita.createType.ex.post.dao.PostDAO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.model.PostDetail;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	private UserBO userBO;
	
	private CommentBO commentBO;

	// 포스트 입력
	public int addNewPost(int userId, int channelId, String title, String subtitle, String content, int category, int price) {
		return postDAO.insertNewPost(userId, channelId, title, subtitle, content, category, price);
	}

	// 포스트 detail 출력
	public PostDetail getPost(int id) {
		Post post = postDAO.selectPost(id);
		List<CommentDetail> commentList = commentBO.getCommentList(id);
		int userId = post.getUserId();
		User user = userBO.getUserById(userId);
		
		PostDetail postDetailList = new PostDetail();
		
		PostDetail postDetail = new PostDetail();
		
		postDetail.setPost(post);
		postDetail.setCommentList(commentList);
		postDetail.setUser(user);
		return postDetailList;
	}
	
	
	
	
}
