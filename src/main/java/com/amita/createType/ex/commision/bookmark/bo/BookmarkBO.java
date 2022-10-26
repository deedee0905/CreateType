package com.amita.createType.ex.commision.bookmark.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.commision.bo.CommisionBO;
import com.amita.createType.ex.commision.bookmark.dao.BookmarkDAO;
import com.amita.createType.ex.commision.bookmark.model.Bookmark;
import com.amita.createType.ex.commision.bookmark.model.BookmarkDetail;
import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommisionBO commisionBO;
	
	// 커미션 포스트에 북마크 insert
	public int addBookmark(int userId, int postId, int channelId) {
		return bookmarkDAO.insertBookmark(userId, postId, channelId);
	}
	
	// 커미션 포스트에 북마크 delete
	public int deleteBookmark(int userId, int postId, int channelId) {
		return bookmarkDAO.deleteBookmark(userId, postId, channelId);
	}
	
	// 커미션 포스트에 북마크 여부 판별하는 기능
	public int bookmarkDiscrimination(int userId, int postId) {
		return bookmarkDAO.bookmarkDiscrimination(userId, postId);
	}
	
	// 북마크한 커미션 post를 userId 값으로 읽어오기
			public List<BookmarkDetail> getBookmarkList(int userId){
				List<Bookmark> bookmarkList = bookmarkDAO.selectBookmarkList(userId);
				
				List<BookmarkDetail> bookmarkDetailList = new ArrayList<>();
				
				for(Bookmark bookmark : bookmarkList) {
					int postId = bookmark.getCommisionPostId();
					CommisionPost commisionPost = commisionBO.getCommisionPostInfoByPostId(postId);
					
					int userNumber = commisionPost.getUserId();
					User user = userBO.getUserInfo(userNumber);
					
					BookmarkDetail bookmarkdetail = new BookmarkDetail();
					
					bookmarkdetail.setBookmark(bookmark);
					bookmarkdetail.setCommisionPost(commisionPost);
					bookmarkdetail.setUser(user);
					
					bookmarkDetailList.add(bookmarkdetail);
				}
					
				return bookmarkDetailList;
			}
				
				
	
	

}
