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

}
