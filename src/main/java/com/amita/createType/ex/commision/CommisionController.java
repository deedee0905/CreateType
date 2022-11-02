package com.amita.createType.ex.commision;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.commision.bo.CommisionBO;
import com.amita.createType.ex.commision.bookmark.bo.BookmarkBO;
import com.amita.createType.ex.commision.bookmark.model.BookmarkDetail;
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
	
	@Autowired
	private BookmarkBO bookmarkBO;
	
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
		
		HttpSession session = request.getSession();
		Object userId = session.getAttribute("userId");
				
		CommisionPost postInfo = commisionBO.getCommisionPostInfoByPostId(id);
		int user = postInfo.getUserId();
		User userInfo = userBO.getUserInfo(user);
		
		if(userId == null) {
			int bookmark = 0;
			model.addAttribute("bookmark", bookmark);
		} else {
			int userid = (Integer)session.getAttribute("userId");
			int bookmark = bookmarkBO.bookmarkDiscrimination(userid, id);
			model.addAttribute("bookmark", bookmark);
		}
		
		model.addAttribute("postInfo", postInfo);
		model.addAttribute("userInfo", userInfo);
		
		return "commision/postView";
	}
	
	
	// 보관함 북마크 view
	@GetMapping("/library/view")
	public String libraryBookmark(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<BookmarkDetail> bookmarkList = bookmarkBO.getBookmarkList(userId);
		
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "commision/libraryBookmark";
	}
	
	// 채널 계정주가 작성한 커미션 포스트 전체 view
	@GetMapping("/postAll/view")
	public String commisionPostAllView(
			@RequestParam("userId") int userId
			, Model model
			) {
		
		List<CommisionPost> postList = commisionBO.getCommisionInfosByUserId(userId);
		int count = commisionBO.countPosts(userId);
		
		model.addAttribute("postList", postList);
		model.addAttribute("count", count);
		
		return "commision/postAll";
	}
	
	// 커미션 신청 view 페이지
	@GetMapping("/proposal/view")
	public String commisionProposalView(
			@RequestParam("commisionPostId") int commisionPostId
			, @RequestParam("userId") int userId
			, Model model
			) {
		
		User user = userBO.getUserInfo(userId);
		CommisionPost commisionPost = commisionBO.getCommisionPostInfoByPostId(commisionPostId);
		
		model.addAttribute("commisionPostId", commisionPostId);
		model.addAttribute("commisionUserId", userId);
		model.addAttribute("user", user);
		model.addAttribute("commisionPost", commisionPost);
		
		return "commision/commisionProposal";
	}
	

	


}
