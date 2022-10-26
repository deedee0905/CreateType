package com.amita.createType.ex.commision;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.commision.bo.CommisionBO;

@RestController
@RequestMapping("/commision")
public class CommisionRestController {

	@Autowired
	private CommisionBO commisionBO;
	
	@PostMapping("/postCreate")
	public Map<String, String> addNewPost(
			HttpServletRequest request
			, @RequestParam("title") String title
			, @RequestParam("content") String content
			, @RequestParam("category") int category
			, @RequestParam("minimumPrice") int minimumPrice
			, @RequestParam("maximumPrice") int maximumPrice
			, @RequestParam("deadline") int deadline
			, @RequestParam("question") String question
			, @RequestParam("file") MultipartFile file
			){
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		int channelId = (Integer)session.getAttribute("channelId");
		
		int count = commisionBO.addNewPost(userId, channelId, title, content, category, minimumPrice, maximumPrice, deadline, question, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}