package com.amita.createType.ex.commision;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.commision.bo.CommisionBO;
import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.commision.model.CommisionPostDetail;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Controller
@RequestMapping("/commision")
public class CommisionController {
	
	@Autowired
	private CommisionBO commisionBO;
	
	@Autowired
	private UserBO userBO;
	
	// 커미션 포스트 insert view
	@GetMapping("/postCreate/view")
	public String commisionPostCreateView() {
		return "commision/newCommisionPost";
	}
	
	// 커미션 포스트 카테고리별 view
	@GetMapping("/List/view")
	public String commisionListView(
			@RequestParam("category") int category
			, Model model
			) {
		List<CommisionPostDetail> commisionPostList = commisionBO.getCategory(category);
		
		model.addAttribute("commisionPostList", commisionPostList);
		
		return "commision/commisionContents";
	}
	
	// 커미션 포스트 object view
	@GetMapping("/postObject/view")
	public String commisionPostObjectView(
			HttpServletRequest request
			, @RequestParam("id") int id
			, @RequestParam("channelId") int channelId
			, Model model
			) {
		
		CommisionPost postInfo = commisionBO.getCommisionPostInfoByPostId(id);
		int user = postInfo.getUserId();
		User userInfo = userBO.getUserInfo(user);
		
		model.addAttribute("postInfo", postInfo);
		model.addAttribute("userInfo", userInfo);
		
		return "commision/postView";
	}
	


}
