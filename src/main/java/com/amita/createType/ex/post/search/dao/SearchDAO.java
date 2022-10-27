package com.amita.createType.ex.post.search.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.post.model.Post;

@Repository
public interface SearchDAO {
	
	// 창작 포스트 검색
	public List<Post> selectSearchListByPostTitle(@Param("title") String title);

	// 커미션 포스트 검색
	public List<CommisionPost> selectSearchCommisionListByPostTitle(@Param("title") String title);
	
	
}
