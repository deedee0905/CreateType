package com.amita.createType.ex.post.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.search.bo.SearchBO;


@Controller
@RequestMapping("/post")
public class SeachController {
	
	@Autowired
	private SearchBO searchBO;
	
	@GetMapping("/search/view")
	public String seachView(
			@RequestParam("title") String title
			, Model model
			) {
		
		List<Post> postList = searchBO.getSearchListByTitle(title);
		
		model.addAttribute("postList", postList);
		
		return "post/searchList";
	}

}
