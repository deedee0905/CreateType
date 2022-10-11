package com.amita.createType.ex.post;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.post.bo.PostBO;
import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.comment.model.Comment;
import com.amita.createType.ex.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	// 크리에이트 타입 메인 view
	@GetMapping("/main/view")
	public String createTypeMainView() {
		
		return "post/mainView";
	}
	
	// 창작 컨텐츠 전체 view
	@GetMapping("/createList/view")
	public String createListView() {
		
		return "post/createContents";
	}
	
	// 포스트 발행 view
	@GetMapping("/create/newPost/view")
	public String newPostView() {
		return "post/newPost";
	}
	
	// 포스트 단일 view
	@GetMapping("/create/postObject/view")
	public String postObject(
			@RequestParam("id") int id
			, Model model
			) {
	
		Post post = postBO.getPost(id);
		List<Comment> commentList = commentBO.getCommentList(id);
		
		
		
		model.addAttribute("post", post);
		model.addAttribute("commentList", commentList);
		
		
		
		return "post/postView";
	}

}
