package com.amita.createType.ex.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.post.comment.bo.CommentBO;

@RestController
@RequestMapping("post")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	// 덧글입력 api
	@PostMapping("/comment/insert")
	public Map<String, String> addComment(
			HttpServletRequest request
			,@RequestParam("postId") int postId
			, @RequestParam("comment") String comment){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.addComment(userId, postId, comment);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	

	@GetMapping("/comment/delete")
	public Map<String, String> deleteComment(
			HttpServletRequest request
			, @RequestParam("id") int id
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.deleteComment(userId, id);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}

}
