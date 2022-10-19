package com.amita.createType.ex.post.search.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.like.bo.LikeBO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.model.PostDetail;
import com.amita.createType.ex.post.search.dao.SearchDAO;
import com.amita.createType.ex.post.viewCount.bo.ViewCountBO;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;


@Service
public class SearchBO {

	
	@Autowired
	private SearchDAO searchDAO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ViewCountBO viewCountBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public List<PostDetail> getSearchListByTitle(String title){
		
		List<Post> postList = searchDAO.selectSearchListByPostTitle(title);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			int postId = post.getId();
			int userId = post.getUserId();
			
			int likeCount = likeBO.likeCount(postId);
			int viewCount = viewCountBO.viewCount(postId);
			User user = userBO.getUserInfo(userId);
			int commentCount = commentBO.commentCount(postId);
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setLikeCount(likeCount);
			postDetail.setViewCount(viewCount);
			postDetail.setUser(user);
			postDetail.setPost(post);
			postDetail.setCommentCount(commentCount);
			
			postDetailList.add(postDetail);
			
		}
		
		return postDetailList;
	}
	
	
	
}
