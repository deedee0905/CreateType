package com.amita.createType.ex.commision;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commision")
public class CommisionController {
	
	@GetMapping("/postCreate/view")
	public String commisionPostCreateView() {
		return "commision/newCommisionPost";
	}

}
