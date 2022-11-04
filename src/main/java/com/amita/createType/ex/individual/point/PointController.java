package com.amita.createType.ex.individual.point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amita.createType.ex.individual.point.bo.PointBO;
import com.amita.createType.ex.individual.point.model.Point;
import com.amita.createType.ex.individual.point.model.PointDetail;

@Controller
@RequestMapping("/individual/point")
public class PointController {
	
	@Autowired
	private PointBO pointBO;
	
	// 포인트 view 페이지
		@GetMapping("/view")
		public String pointMainView(
				HttpServletRequest request
				, Model model
				) {
			
			HttpSession session = request.getSession();
			int userId = (Integer)session.getAttribute("userId");
			
			Integer point = pointBO.getTotalPoint(userId);
			List<PointDetail> purchaseList = pointBO.getPurchaseList(userId);
			
			if(point == null) {
				point = 0;
			}
			
			model.addAttribute("point", point);
			model.addAttribute("purchaseList", purchaseList);
			
			return "individual/point";
		}
		
		// 포인트충전 view 페이지
		@GetMapping("/charge/view")
		public String pointChargeView() {
			return "individual/pointCharge";
		}
		
		// 수익내역 view 페이지
		@GetMapping("/revenue/view")
		public String myRevenueView(
				HttpServletRequest request
				, Model model
				) {
			
			HttpSession session = request.getSession();
			int channelId = (Integer)session.getAttribute("channelId");
			
			List<Point> revenueList = pointBO.getRevenueList(channelId);
			Integer revenue = pointBO.getTotalrevenue(channelId);
			
			if(revenue == null) {
				revenue = 0;
			} else {
				revenue = (revenue * -1);
			}
			
			model.addAttribute("revenueList", revenueList);
			model.addAttribute("revenue", revenue);
			
			return "individual/revenue";
		}
		

}
