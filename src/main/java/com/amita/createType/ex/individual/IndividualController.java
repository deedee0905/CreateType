package com.amita.createType.ex.individual;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amita.createType.ex.individual.bo.IndividualBO;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Controller
@RequestMapping("/individual")
public class IndividualController {
	
	
	@Autowired
	private UserBO userBO;
	
	// 유저탭 > MY채널 view
	@GetMapping("/profile/view") 
	public String profileMainView() {
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
	public String channeMainlView() {
		return "individual/channelView";
	}
	
	// 채널 프로필, 자기소개 변경 view
	@GetMapping("/channel/setting/view")
	public String channelProfileChangeView() {
		
		
		return "individual/channelProfileChange";
	}
	
	// 채널 생성 view
	@GetMapping("/channel/create/view")
	public String channelCreateView() {
		return "individual/channelCreate";
	}

}
