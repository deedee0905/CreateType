package com.amita.createType.ex.individual;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/individual")
public class IndividualController {
	
	@GetMapping("/profile/view") 
	public String profileMainView() {
		return "individual/profile";
	}
	
	@GetMapping("/profile/setting/view")
	public String profileChangeView() {
		return "individual/profileChange";
	}
	
	@GetMapping("/channel/view")
	public String channeMainlView() {
		return "individual/channelView";
	}
	
	@GetMapping("/channel/setting/view")
	public String channelProfileChangeView() {
		return "individual/channelProfileChange";
	}

}
