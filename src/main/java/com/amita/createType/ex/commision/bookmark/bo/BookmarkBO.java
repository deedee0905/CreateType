package com.amita.createType.ex.commision.bookmark.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.commision.bookmark.dao.BookmarkDAO;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	// 커미션 포스트에 북마크 insert
	public int addBookmark(int userId, int postId, int channelId) {
		return bookmarkDAO.insertBookmark(userId, postId, channelId);
	}
	
	// 커미션 포스트에 북마크 delete
	public int deleteBookmark(int userId, int postId, int channelId) {
		return bookmarkDAO.deleteBookmark(userId, postId, channelId);
	}
	

}
