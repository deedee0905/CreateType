package com.amita.createType.ex.post.search.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.search.dao.SearchDAO;


@Service
public class SearchBO {

	
	@Autowired
	private SearchDAO searchDAO;
	
	
	public List<Post> getSearchListByTitle(String title){
		return searchDAO.selectSearchListByPostTitle(title);
	}
	
	
	
}
