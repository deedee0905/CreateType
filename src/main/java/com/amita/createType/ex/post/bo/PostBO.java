package com.amita.createType.ex.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.comment.bo.CommentDetail;
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
	public List<PostDetail> getPost(int id) {
		List<Post> postList = postDAO.selectPost(id);
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			
			List<CommentDetail> commentList = commentBO.getCommentList(post.getId());
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setPost(post);
			postDetail.setUser(user);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		return postDetailList;
	}
	
	
	
	
}
