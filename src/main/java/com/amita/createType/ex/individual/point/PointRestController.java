package com.amita.createType.ex.individual.point;

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

import com.amita.createType.ex.individual.point.bo.PointBO;

@RestController
@RequestMapping("/individual/point")
public class PointRestController {
	
	@Autowired
	private PointBO pointBO;
	
	// 포인트 충전 api
	@PostMapping("/charge")
	public Map<String, String> addPointCharge(
			HttpServletRequest request
			, @RequestParam("methodOfPayment") String methodOfPayment
			, @RequestParam("price") int price
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = pointBO.addPointCharge(userId, methodOfPayment, price);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 수익포인트 출금 api
	@GetMapping("/withdraw")
	public Map<String, String> pointWithdraw(
			HttpServletRequest request
			, @RequestParam("methodOfPayment") String methodOfPayment
			, @RequestParam("price") int price
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int channelId = (Integer)session.getAttribute("channelId");
		
		int count = pointBO.pointWithdraw(userId, methodOfPayment, price, channelId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}

}
