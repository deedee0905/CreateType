package com.amita.createType.ex.post;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@PostMapping("/create/newPost")
	public Map<String, String> addNewPost(
			@RequestParam("channelId") int channelId
			,@RequestParam("title") String title
			,@RequestParam("subtitle") String subtitle
			,@RequestParam("content") String content
			,@RequestParam("image") String image
			,@RequestParam("thumbnail") String thumnail
			,@RequestParam("category") int category
			, HttpServletRequest request
			){
		
	}

}
