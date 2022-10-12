package com.amita.createType.ex.post.bo;



import java.util.List;

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
	
	// 포스트 카테고리 view 출력
	public List<Post> getCategory(int category) {
		return postDAO.selectCategory(category);
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
	
}
