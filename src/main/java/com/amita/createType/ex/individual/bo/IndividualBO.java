package com.amita.createType.ex.individual.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.individual.dao.IndividualDAO;
import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.individual.model.ChannelViewDetail;
import com.amita.createType.ex.post.like.bo.LikeBO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.post.viewCount.bo.ViewCountBO;



@Service
public class IndividualBO {
	
	@Autowired
	private IndividualDAO individualDAO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private ViewCountBO viewCountBO;
	
	
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
	
	// 채널 구독자 수 count
	public int countSubscriber(int channelId) {
		return individualDAO.selectScriberCount(channelId);
	}
	
	// 채널 main/view 페이지에서 발행된 포스트의 List를 가져오기
	public List<ChannelViewDetail> getPostList(int channelId){
		
		List<Post> postList = individualDAO.selectPostList(channelId);
		List<ChannelViewDetail> channelViewDetailList = new ArrayList<>();
		
		for(Post post : postList) {
			int postId = post.getId();
			int likeCount = likeBO.likeCount(postId);
			int viewCount = viewCountBO.viewCount(postId);
			
			ChannelViewDetail channelViewDetail = new ChannelViewDetail();
			
			channelViewDetail.setLikeCount(likeCount);
			channelViewDetail.setPost(post);
			channelViewDetail.setViewCount(viewCount);
			channelViewDetailList.add(channelViewDetail);
		}
		return channelViewDetailList;
	}

	

}
