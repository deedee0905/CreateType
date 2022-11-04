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

import com.amita.createType.ex.common.FileManagerService;
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
			HttpServletRequest request
			,@RequestParam("id") int id
			,@RequestParam("title") String title
			, @RequestParam("subtitle") String subtitle
			, @RequestParam("content") String content
			, @RequestParam("file") MultipartFile file
			, @RequestParam("category") int category
			, @RequestParam("price") int price
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.updatePost(userId, id, title, subtitle, content, file, category, price);
		
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
	
	// summerNote 이미지 처리
	@PostMapping("/uploadSummernoteImageFile")
	public Map<String, String> uploadSummerNoteImageFile(
			@RequestParam("file") MultipartFile multipartFile
			, HttpServletRequest request){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		
		
		String imagePath = FileManagerService.saveFile(userId, multipartFile);
		
		Map<String, String> data = new HashMap<>();
		
		data.put("url", imagePath);
		
		return data;
		
	}

	// 포스트 구매 api
	@GetMapping("/purchase")
	public Map<String, String> postPurchase(
			HttpServletRequest request
			, @RequestParam("methodOfPayment") String methodOfPayment
			, @RequestParam("price") int price
			, @RequestParam("postId") int postId
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.postPurchase(userId, methodOfPayment, price, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
	
	
	
}
