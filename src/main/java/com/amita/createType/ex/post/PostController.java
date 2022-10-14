package com.amita.createType.ex.post;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.post.bo.PostBO;
import com.amita.createType.ex.post.comment.bo.CommentBO;
import com.amita.createType.ex.post.comment.model.Comment;
import com.amita.createType.ex.post.like.bo.LikeBO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.viewCount.bo.ViewCountBO;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ViewCountBO viewcountBO;
	
	@Autowired
	private UserBO userBO;
	
	
	// 크리에이트 타입 메인 view
	@GetMapping("/main/view")
	public String createTypeMainView() {
		
		return "post/mainView";
	}
	
	// 창작 컨텐츠 전체 view
	@GetMapping("/createList/view")
	public String createListView(
			@RequestParam("category") int category
			, Model model
			) {
		
		List<Post> postCategory = postBO.getCategory(category);
		
		
		model.addAttribute("postCategory", postCategory);
		
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
			HttpServletRequest request
			,@RequestParam("id") int id
			, Model model
			) {
		
		Post post = postBO.getPost(id);
		List<Comment> commentList = commentBO.getCommentList(id);
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int like = likeBO.isLike(userId, id);
		int count = viewcountBO.viewCount(id);
		
		
		model.addAttribute("post", post);
		model.addAttribute("commentList", commentList);
		model.addAttribute("like", like);
		model.addAttribute("count", count);
		
		
		
	
		
		return "post/postView";
	}
	
	@GetMapping("/update")
	public String update(
			@RequestParam("id") int id
			,Model model
			) {
		
		Post post = postBO.updatePostSelect(id);
		
		model.addAttribute("post", post);
		
		return "post/postUpdate";
	}
	

}
