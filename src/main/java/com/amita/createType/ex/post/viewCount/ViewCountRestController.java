package com.amita.createType.ex.post.viewCount;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amita.createType.ex.post.viewCount.bo.ViewCountBO;

@RestController
public class ViewCountRestController {

	@Autowired
	private  ViewCountBO viewcountBO;
	
	@GetMapping("/viewCount")
	public Map<String, String> getViewCount(
			HttpServletRequest request
			, @RequestParam("postId") int postId
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = viewcountBO.addViewCount(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		 return result;
	}
	
}
