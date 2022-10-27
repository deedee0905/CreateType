package com.amita.createType.ex.post.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.commision.model.CommisionPostDetail;
import com.amita.createType.ex.post.model.PostDetail;
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
		
		List<PostDetail> postList = searchBO.getSearchListByTitle(title);
		List<CommisionPostDetail> commisionPostList = searchBO.getSearchCommisionListByTitle(title);
		
		model.addAttribute("postList", postList);
		model.addAttribute("commisionPostList", commisionPostList);
		
		return "post/searchList";
	}

}
