package com.amita.createType.ex.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("/main/view")
	public String createTypeMainView() {
		
		return "post/mainView";
	}
	
	@GetMapping("/createList/view")
	public String createListView() {
		
		return "post/createContents";
	}
	
	@GetMapping("/create/newPost/view")
	public String newPostView() {
		return "post/newPost";
	}

}
