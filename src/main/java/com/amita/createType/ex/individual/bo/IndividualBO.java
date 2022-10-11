package com.amita.createType.ex.individual.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.individual.dao.IndividualDAO;

@Service
public class IndividualBO {
	
	@Autowired
	private IndividualDAO individualDAO;
	
	// 채널 생성 api
	public int addChannel(String channelName, String channelInfo, MultipartFile file, int userId) {
		
		String imagePath = null;
		if(file != null) { // 저장 성공
			imagePath = FileManagerService.saveFile(userId, file);
			
			if(imagePath == null) { // 저장 실패
				return 0;
			}
		} 
		
		return individualDAO.insertChannel(channelName, channelInfo, imagePath, userId);
	}

	
	
	

}
