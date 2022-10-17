package com.amita.createType.ex.individual.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.individual.dao.IndividualDAO;
import com.amita.createType.ex.individual.model.Channel;



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

	// 개인 프로필 변경
	public int updateProfile(int id, String nicknakme, MultipartFile file) {
		
		String imagePath = null;
		if(file != null) { // 파일 저장 성공
			imagePath = FileManagerService.saveFile(id, file);
			
			if(imagePath == null) { //파일 저장 실패
				return 0;
			}
			
		}
		
		return individualDAO.updatePrivateProfile(id, nicknakme, imagePath);
	}
	
	// 채널 프로필 업데이트 api
	public int updateChannelProfile(int id, String channelName, String channelInfo, MultipartFile file) {
		
		String imagePath = null;
		if(file != null) { // 파일 저장 성공
			imagePath = FileManagerService.saveFile(id, file);
			
			if(imagePath == null) { // 파일 저장 실패
				return 0;
			}
			
		}
		return individualDAO.updateChannelProfile(id, channelName, channelInfo, imagePath);
	}
	
	// 채널 프로필 정보 가져오기
	public Channel getChannelInfo(int id) {
		return individualDAO.selectChannelInfoById(id);
	}
	
	

	

}
