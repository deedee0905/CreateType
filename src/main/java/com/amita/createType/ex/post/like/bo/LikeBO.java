package com.amita.createType.ex.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	// 좋아요 insert api
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	// 좋아요 delete api
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요를 체크했는지 확인하기
	public int isLike(int userId, int postId) {
		
		return likeDAO.selectCountLikeByUserId(userId, postId);
		
	}
	
	// 좋아요 count
	public int likeCount(int postId) {
		return likeDAO.selectCountLike(postId);
	}

}
