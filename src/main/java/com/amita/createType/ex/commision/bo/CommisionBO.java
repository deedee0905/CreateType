package com.amita.createType.ex.commision.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.commision.dao.CommisionDAO;
import com.amita.createType.ex.common.FileManagerService;

@Service
public class CommisionBO {
	
	@Autowired
	private CommisionDAO commisionDAO;
	
	public int addNewPost(
			int userId
			, int channelId
			, String title
			, String content
			, int category
			, int minimumPrice
			, int maximumPrice
			, int deadline
			, String question
			, MultipartFile file
			) {
		
		String imagePath = null;
		
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) {
				return 0;
			}
		}
		
		return commisionDAO.insertCommisionPost(userId, channelId, title, content, category, minimumPrice, maximumPrice, deadline, question, imagePath);
	}

}
