package com.amita.createType.ex.individual;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.individual.bo.IndividualBO;
import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.individual.model.ChannelViewDetail;
import com.amita.createType.ex.individual.model.LibraryDetail;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Controller
@RequestMapping("/individual")
public class IndividualController {
	
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private IndividualBO individualBO;
	

	
	// 유저탭 > MY채널 view
	@GetMapping("/profile/view") 
	public String profileMainView(
			@RequestParam("userId") int userId
			, @RequestParam("channelId") Integer channelId
			, Model model
			) {
		
		
		if(channelId == null) {
			channelId = 0;
		} else {
			Channel channel = userBO.getChannelUserById(userId);
			int subscriber = individualBO.countSubscriber(channelId);
			model.addAttribute("channel", channel);
			model.addAttribute("subscriber", subscriber);
		}
		
		User user = userBO.getUserInfo(userId);
		
		
		model.addAttribute("user", user);
		
		
		return "individual/profile";
	}
	
	// 개인 프로필 변경 view
	@GetMapping("/profile/setting/view")
	public String profileChangeView(
			HttpServletRequest request
			,Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		User user = userBO.getUserInfo(userId);
		
		model.addAttribute("user", user);
		
		return "individual/profileChange";
	}
	
	//채널 전체 view
	@GetMapping("/channel/view")
	public String channeMainlView(
			HttpServletRequest request
			,Model model
			) {
		
		HttpSession session = request.getSession();
		int channelId = (Integer)session.getAttribute("channelId");
		
		Channel channel = individualBO.getChannelInfo(channelId);
		int subscirber = individualBO.countSubscriber(channelId);
		List<ChannelViewDetail> postList = individualBO.getPostList(channelId);
		
		model.addAttribute("channel", channel);
		model.addAttribute("subscirber", subscirber);
		model.addAttribute("postList", postList);
		
		
		return "individual/channelView";
	}
	
	// 채널 프로필, 자기소개 변경 view
	@GetMapping("/channel/setting/view")
	public String channelProfileChangeView(
			HttpServletRequest request
			, Model model
			) {
		HttpSession session = request.getSession();
		int channelId = (Integer)session.getAttribute("channelId");
		
		Channel channel = individualBO.getChannelInfo(channelId);
		
		model.addAttribute("channel", channel);
		
		return "individual/channelProfileChange";
	}
	
	// 채널 생성 view
	@GetMapping("/channel/create/view")
	public String channelCreateView() {
		return "individual/channelCreate";
	}
	
	// 보관함 view 페이지
	@GetMapping("/library/view")
	public String libraryView(
			HttpServletRequest request
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<LibraryDetail> likeList = individualBO.getPostListByLike(userId);
		
		model.addAttribute("likeList", likeList);
		
		
		return "individual/library";
	}

	@GetMapping("payment")
	public String paymentView() {
		
		return "individual/payment";
	}
	
	
}
