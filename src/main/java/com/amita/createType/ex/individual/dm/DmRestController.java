package com.amita.createType.ex.individual.dm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.individual.dm.bo.DmBO;
import com.amita.createType.ex.individual.dm.model.DM;

@RestController
@RequestMapping("/individual")
public class DmRestController {
	
	@Autowired
	private DmBO dmBO;
	
	@PostMapping("/message")
	public Map<String, String> addMessage(
			HttpServletRequest request
			, @RequestParam("userIdOthers") int userIdOthers
			, @RequestParam("message") String message
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = dmBO.addMessage(userId, userIdOthers, message);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	

	
}
