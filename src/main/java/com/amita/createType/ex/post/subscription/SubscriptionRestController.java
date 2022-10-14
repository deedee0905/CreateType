package com.amita.createType.ex.post.subscription;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.post.subscription.bo.SubscriptionBO;

@RestController
@RequestMapping("/individual")
public class SubscriptionRestController {
	
	@Autowired
	private SubscriptionBO subscriptionBO;

	// 구독하기 api
	@GetMapping("/subscription/insert")
	public Map<String, String> addSubscription(
				HttpServletRequest request
				, @RequestParam("channelId") int channelId
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = subscriptionBO.addSubscription(userId, channelId);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1){
			result.put("result", "success");
		} else {
			result.put("result", "fail");;
		}
		return result;
	}
		
		
	// 구독취소 api
		@GetMapping("/subscription/delete")
		public Map<String, String> cancelSubscription(
				HttpServletRequest request
				, @RequestParam("channelId") int channelId
				){
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			int count = subscriptionBO.cancelSubscription(userId, channelId);
			
			Map<String, String> result = new HashMap<>();
			
			if(count == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
			return result;
		}
	
	

}
