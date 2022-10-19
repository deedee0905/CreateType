package com.amita.createType.ex.post.search.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.post.model.Post;

@Repository
public interface SearchDAO {
	
	public List<Post> selectSearchListByPostTitle(@Param("title") String title);

}
