package com.amita.createType.ex.individual.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/individual/point")
public class PointController {
	
	// 포인트 view 페이지
		@GetMapping("/view")
		public String pointMainView() {
			return "individual/point";
		}
		
		// 포인트충전 view 페이지
		@GetMapping("/charge/view")
		public String pointChargeView() {
			return "individual/pointCharge";
		}

}
