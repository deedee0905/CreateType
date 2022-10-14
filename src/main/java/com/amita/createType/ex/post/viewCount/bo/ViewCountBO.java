package com.amita.createType.ex.post.viewCount.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.viewCount.dao.ViewCountDAO;

@Service
public class ViewCountBO {

	@Autowired
	private ViewCountDAO viewcountDAO;
	
	public int addViewCount(int postId) {
		return viewcountDAO.insertViewCount(postId);
	}
	
	public int viewCount(int postId) {
		return viewcountDAO.selectViewCount(postId);
	}
	
}
