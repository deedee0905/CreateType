package com.amita.createType.ex.post;

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
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	// 포스트 발행 api
	@PostMapping("/create/newPost")
	public Map<String, String> addNewPost(
			HttpServletRequest request
			, @RequestParam("title") String title
			, @RequestParam("subtitle") String subtitle
			, @RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, @RequestParam("category") int category
			, @RequestParam("price") int price
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int channelId = (Integer)session.getAttribute("channelId");
		
		int count = postBO.addNewPost(userId, channelId, title, subtitle, content, file, category, price);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

	// 포스트 수정
	@PostMapping("/create/postUpdate")
	public Map<String, String> postUpdate(
			@RequestParam("id") int id
			,@RequestParam("title") String title
			, @RequestParam("subtitle") String subtitle
			, @RequestParam("content") String content
			, @RequestParam("category") int category
			, @RequestParam("price") int price
			){
		
		int count = postBO.updatePost(id, title, subtitle, content, category, price);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	// 포스트 삭제
	@GetMapping("/create/postDelete")
	public Map<String, String> deletePost(
			HttpServletRequest request
			, @RequestParam("id") int id
			){
		
		HttpSession session = request.getSession();
		int channeId = (Integer)session.getAttribute("channelId");
		
		int count = postBO.deletePost(channeId, id);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	
	
	
	
	
	
	
}
