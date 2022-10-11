package com.amita.createType.ex.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.dao.PostDAO;
import com.amita.createType.ex.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;

	// 포스트 입력
	public int addNewPost(int userId, int channelId, String title, String subtitle, String content, int category, int price) {
		return postDAO.insertNewPost(userId, channelId, title, subtitle, content, category, price);
	}

	// 포스트 detail 출력
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	
	
	
}
