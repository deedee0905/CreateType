package com.amita.createType.ex.individual;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.individual.bo.IndividualBO;
import com.amita.createType.ex.individual.model.Channel;

@RestController
@RequestMapping("/individual")
public class IndividualRestController {
	
	@Autowired
	private IndividualBO individualBO;
	
	
	// 채널 생성 api
	@PostMapping("/create/channel")
	public Map<String, String> createChannel(
			@RequestParam("channelName") String channelName
			, @RequestParam("channelInfo") String channelInfo
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = individualBO.addChannel(channelName, channelInfo, file, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");

		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 개인 프로필 변경
	@PostMapping("/profile/individual")
	public Map<String, String> updateProfile(
			HttpServletRequest request
			, @RequestParam("nickname") String nickname
			, @RequestParam("file") MultipartFile file
			){
	
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = individualBO.updateProfile(userId, nickname, file);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
			
		}
		
		return result;
	}
	
	// 채널 프로필 변경
	@PostMapping("/profile/channel")
	public Map<String, String> updateChannleProfile(
			HttpServletRequest request
			, @RequestParam("channelName") String channelName
			, @RequestParam("channelInfo") String channelInfo
			, @RequestParam("file") MultipartFile file
			){
		
		HttpSession session = request.getSession();
		int channelId = (Integer)session.getAttribute("channelId");
		
		int count = individualBO.updateChannelProfile(channelId, channelName, channelInfo, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	


	

}
