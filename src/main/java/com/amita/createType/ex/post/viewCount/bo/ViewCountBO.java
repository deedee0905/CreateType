package com.amita.createType.ex.post.viewCount.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.viewCount.dao.ViewCountDAO;

@Service
public class ViewCountBO {

	@Autowired
	private ViewCountDAO viewcountDAO;
	
	// 조회수 insert api
	public int addViewCount(int postId) {
		return viewcountDAO.insertViewCount(postId);
	}
	
	// 조회수 count
	public int viewCount(int postId) {
		return viewcountDAO.selectViewCount(postId);
	}
	
	// 게시글이 삭제되면서 조회수 삭제 시키기
	public int deleteViewCountByPostId(int postId) {
		return viewcountDAO.deleteViewCountByPostId(postId);
	}
	
}
