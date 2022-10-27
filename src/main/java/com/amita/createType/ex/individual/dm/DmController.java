package com.amita.createType.ex.individual.dm;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.amita.createType.ex.individual.dm.bo.DmBO;
import com.amita.createType.ex.individual.dm.model.DM;

@Controller
@RequestMapping("/individual")
public class DmController {
	
	@Autowired
	private DmBO dmBO;

	// message 전체 화면 view
	@GetMapping("/message/view")
	public String dmMessage(
			HttpServletRequest request
			, @RequestParam("userIdOthers") int userIdOthers
			, Model model
			) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<DM> dms = dmBO.getDMlist(userId, userIdOthers);
		
		model.addAttribute("dms", dms);
		
		return "individual/message";
	}
	
}
