package com.amita.createType.ex.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 로그인 view 페이지
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	// 회원가입 view 페이지
	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	// 로그아웃 기능
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userNickname");
		session.setAttribute("channelId", 0);
		
		return "redirect:/post/main/view";
	}

}
