package com.amita.createType.ex.individual.point;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amita.createType.ex.individual.point.bo.PointBO;

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
			
			int point = pointBO.getTotalPoint(userId);
			
			if(point == 0) {
				point = 0;
			}
			
			model.addAttribute("point", point);
			
			return "individual/point";
		}
		
		// 포인트충전 view 페이지
		@GetMapping("/charge/view")
		public String pointChargeView() {
			return "individual/pointCharge";
		}

}
