package com.amita.createType.ex.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.individual.bo.IndividualBO;
import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	private IndividualBO individualBO;
	
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
	
	// 아이디 중복검사 기능 api
	@GetMapping("/signin/duplicateId")
	public Map<String, Boolean> isIdDuplicate(@RequestParam("loginId") String loginId){
		
		boolean isDuplicate = userBO.isIdDuplicate(loginId);
		
		// 중복시 {"id_duplicate": true}
		// 중복이 아닐 경우에는 {"id_duplicate":false}
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicate) {
			result.put("is_duplicate", true);
		} else {
			result.put("is_duplicate", false);
		}
		
		return result;
	}
	
	
	// 닉네임 중복검사 기능 api
	@GetMapping("/signin/duplicateNickname")
	public Map<String, Boolean> isNicknameDuplicate(@RequestParam("nickname") String nickname){
		
		boolean isDuplicate = userBO.isNicknameDuplicate(nickname);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicate) {
			result.put("is_duplicateNickname", true);
		} else {
			result.put("is_duplicateNickname", false);
		}
		return result;
	}
	
	// 이메일 중복검사 기능 api
	@GetMapping("/signin/duplicateEmail")
	public Map<String, Boolean> isEmailDuplicate(@RequestParam("email") String email){
		
		boolean isDuplicate = userBO.isEmailDuplicate(email);
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(isDuplicate) {
			result.put("is_duplicateEmail", true);
		} else {
			result.put("is_duplicateEmail", false);
		}
		return result;
	}

	
	// 로그인 api
	@PostMapping("/signin")
	public Map<String, String> getLogin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request
			){
		
			
		User user = userBO.getUserLogin(loginId, password);
		
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) { //로그인 성공시, 모든 값이 잘 전달 되었을 때
			result.put("result", "success");
			
			// 세션에 로그인한 사용자의 정보 저장하기
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userNickname", user.getNickname());
			
		}
		else {
				result.put("result", "fail");
			}

		return result;
	}
				
	
	
}
