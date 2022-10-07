package com.amita.createType.ex.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;

public int addNewPost(int userId, int channelId, String title, String subtitle, String content, int category, int price) {
		return postDAO.insertNewPost(userId, channelId, title, subtitle, content, category, price);
	}
	
}
