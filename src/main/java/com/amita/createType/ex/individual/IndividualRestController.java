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

import com.amita.createType.ex.individual.dao.IndividualDAO;

@RestController
@RequestMapping("/individual")
public class IndividualRestController {
	
	@Autowired
	private IndividualDAO individualDAO;
	
	@PostMapping("/create/channel")
	public Map<String, String> createChannel(
			@RequestParam("channelName") String channelName
			, @RequestParam("channelInfo") String channelInfo
			, @RequestParam("channelImagePath") String channelImagePath
			, HttpServletRequest request
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = individualDAO.insertChannel(channelName, channelInfo, channelImagePath, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}

}
