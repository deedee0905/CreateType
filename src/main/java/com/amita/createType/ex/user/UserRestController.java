package com.amita.createType.ex.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 회원가입 api
	@PostMapping("/signup")
	public Map<String, String> addSignup(
			@RequestParam("loginId") String loginId
			, @RequestParam("nickname") String nickname
			, @RequestParam("email") String email
			, @RequestParam("password") String password
			){
		
		
		int count = userBO.addSingup(loginId, nickname, email, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

}
