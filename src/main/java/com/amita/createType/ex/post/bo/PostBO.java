package com.amita.createType.ex.post.bo;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.individual.model.Channel;
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
	public int addNewPost(
			int userId
			, int channelId
			, String title
			, String subtitle
			, String content
			, MultipartFile file
			, int category
			, int price) {
		
		String imagePath = null;
		
		if(file != null) {
			imagePath =  FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.insertNewPost(userId, channelId, title, subtitle, content, imagePath,category, price);
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
			int userId
			, int id
			,String title
			, String subtitle
			, String content
			, MultipartFile file
			, int category
			, int price
			) {
		
		String imagePath = null;
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.updatePost(userId, id, title, subtitle, content, imagePath, category, price);
	}
	
	// 발행된 포스트 delete api
	public int deletePost(int channelId, int id) {
		
		Post post = postDAO.selectPostListByPostId(id);
		
		if(post == null) {
			return 0;
		}
		
		// 게시글과 연결된 파일 삭제하기
		FileManagerService.removeFile(post.getThumbnail());
		
		//좋아요 삭제
		likeBO.deleteLikeByPostId(id);
		//덧글 삭제
		commentBO.deleteCommentByPostId(id);
		//조회수 삭제
		viewCountBO.deleteViewCountByPostId(id);
		
		return postDAO.deletePost(channelId, id);
	}
	
	// postId를 기반으로 발행된 포스트 List를 가져오기
	public Post getPostListByPostId(int postId){
		return postDAO.selectPostListByPostId(postId);
	}
	
	// userId를 기반으로 발행된 포스트의 List를 가져오기
	public List<PostDetail> getAllPostListByUserId(int userId){
		
		List<Post> postList = postDAO.selectPostListByUserId(userId);
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			int postId = post.getId();
			
			int likeCount = likeBO.likeCount(postId);
			int viewCount = viewCountBO.viewCount(postId);
			int commentCount = commentBO.commentCount(postId);
			User user = userBO.getUserInfo(userId);
			Channel channel = postDAO.selectChannelInfoByUserId(userId);
			
			PostDetail postDetail = new PostDetail();
			
			postDetail.setLikeCount(likeCount);
			postDetail.setViewCount(viewCount);
			postDetail.setCommentCount(commentCount);
			postDetail.setUser(user);
			postDetail.setPost(post);
			postDetail.setChannel(channel);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	// 로그인한 userId를 기반으로 작성된 게시글의 갯수 count
	public int postCount(int userId) {
		return postDAO.selectPostCount(userId);
	}
	
	// 로그인한 userId를 기반으로 채널 정보를 가져오기
	public Channel getChannelInfoByUserId(int userId) {
		return postDAO.selectChannelInfoByUserId(userId);
	}
	
}
