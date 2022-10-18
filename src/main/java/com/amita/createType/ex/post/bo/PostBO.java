package com.amita.createType.ex.post.bo;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.dao.PostDAO;
import com.amita.createType.ex.post.like.bo.LikeBO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.model.PostDetail;
import com.amita.createType.ex.post.viewCount.bo.ViewCountBO;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;



@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;

	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ViewCountBO viewCountBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	

	// 포스트 입력
	public int addNewPost(int userId, int channelId, String title, String subtitle, String content, int category, int price) {
		return postDAO.insertNewPost(userId, channelId, title, subtitle, content, category, price);
	}

	// 포스트 detail 출력
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	// 포스트 카테고리 view 출력
	public List<PostDetail> getCategory(int category) {
		
		List<Post> postList = postDAO.selectCategory(category);
		
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
	
	// 발행된 포스트 데이터 select
	public Post updatePostSelect(int id) {
		return postDAO.updatePostSelect(id);
	}
	
	// 발행된 포스트의 데이터 update
	public int updatePost(
			int id
			,String title
			, String subtitle
			, String content
			, int category
			, int price
			) {
		return postDAO.updatePost(id, title, subtitle, content, category, price);
	}
	
	// 발행된 포스트 삭제 api
	public int deletePost(int channelId, int id) {
		return postDAO.deletePost(channelId, id);
	}
	
	// postId를 기반으로 발행된 포스트 List를 가져오기
	public Post getPostListByPostId(int postId){
		return postDAO.selectPostListByPostId(postId);
	}
	
	
}
