package com.amita.createType.ex.commision.bookmark;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.commision.bookmark.bo.BookmarkBO;

@RestController
@RequestMapping("/commision")
public class BookmarkRestController {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
	// 북마크 INSERT
	@GetMapping("/bookmark/insert")
	public Map<String, String> addBookmark(
			HttpServletRequest request
			, @RequestParam("postId") int postId
			, @RequestParam("channelId") int channelId
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = bookmarkBO.addBookmark(userId, postId, channelId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 북마크 DELETE
	@GetMapping("/bookmark/delete")
	public Map<String, String> deleteBookmark(
			HttpServletRequest request
			, @RequestParam("postId") int postId
			, @RequestParam("channelId") int channelId
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = bookmarkBO.deleteBookmark(userId, postId, channelId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	

}
