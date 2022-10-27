package com.amita.createType.ex.individual.dm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/individual")
public class DmController {

	// message 전체 화면 view
	@GetMapping("/message/view")
	public String dmMessage() {
		return "individual/message";
	}
	
}
