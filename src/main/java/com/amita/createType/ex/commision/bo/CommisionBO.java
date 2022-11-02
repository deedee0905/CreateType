package com.amita.createType.ex.commision.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amita.createType.ex.commision.dao.CommisionDAO;
import com.amita.createType.ex.commision.model.CommisionPost;
import com.amita.createType.ex.commision.model.CommisionPostDetail;
import com.amita.createType.ex.commision.model.CommisionProposal;
import com.amita.createType.ex.commision.model.CommisionProposalDetail;
import com.amita.createType.ex.common.FileManagerService;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class CommisionBO {
	
	@Autowired
	private CommisionDAO commisionDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 커미션 포스트 insert api
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
	
	// 발행된 커미션 post를 category 값으로 읽어오기
	public List<CommisionPostDetail> getCategory(int category){
		List<CommisionPost> commisionList = commisionDAO.selectCommisionCategory(category);
		
		List<CommisionPostDetail> commisionDetailList = new ArrayList<>();
		
		for(CommisionPost commisionPost : commisionList) {
			int userId = commisionPost.getUserId();
			User user = userBO.getUserInfo(userId);
			
			CommisionPostDetail commisionPostDetail = new CommisionPostDetail();
			
			commisionPostDetail.setUser(user);
			commisionPostDetail.setCommisionPost(commisionPost);
			
			commisionDetailList.add(commisionPostDetail);
		}
		return commisionDetailList;
	}
	
	// commisionPost id 기반으로 포스트의 정보를 가져오기
	public CommisionPost getCommisionPostInfoByPostId(int id) {
		return commisionDAO.selectCommisionPostInfoByPostId(id);
	}
	
	// channelView 에서 해당 채널의 사용자가 작성한 커미션 포스트 정보를 가져오기
	public List<CommisionPost> getCommisionPostList(int channelId){
		return commisionDAO.selectCommisionPost(channelId);
	}
	
	// commisionPost에 저장된 userId를 기반으로 정보를 >하나씩< 가져오기
	public CommisionPost getCommisionInfoByUserId(int userId) {
		return commisionDAO.selectCommisionPostInfoByUserId(userId);
	}
	
	// commisionPost에 저장된 userId를 기반으로 정보를 >여러개< 가져오기
	public List<CommisionPost> getCommisionInfosByUserId(int userId) {
		return commisionDAO.selectsCommisionPostsInfosByUserId(userId);
	}
	
	// commisionPost에 저장된 userId를 기반으로 저장된 포스트의 개수를 세기
	public int countPosts(int userId) {
		return commisionDAO.selectCountPosts(userId); 
	}
	
	// 커미션 포스트 신청 insert
	public int commisionProposal(int userId, int commisionPostId, int postUserId, String content, String processing) {
		
		return commisionDAO.insertCommisionProposal(userId, commisionPostId, postUserId, content, processing);
	}
	
	// 커미션 포스트 아이디로 해당 포스트의 정보를 얻기
	public CommisionPost getPostInfoByCommisionPostId(int commisionPostId) {
		return commisionDAO.selectCommisionPostInfoByPostId(commisionPostId);
	}
	
	// 신청한 커미션 포스트 List
	public List<CommisionProposal> getCommisionProposalList(int userId){
		return commisionDAO.selectCommisionProposalList(userId);
	}
	
	// 신청한 커미션 포스트 Detail List
	public List<CommisionProposalDetail> getCommisionProposalDetailList(int userId){
		List<CommisionProposal> commisionProposalList = commisionDAO.selectCommisionProposalList(userId);
		
		List<CommisionProposalDetail> commisionProposalDetail = new ArrayList<>();
		
		for(CommisionProposal commisionProposal : commisionProposalList) {
			int commisionPostId = commisionProposal.getCommisionPostId();
			int postUserId = commisionProposal.getPostUserId();
			
			CommisionPost commisionPost = commisionDAO.selectPostInfoByCommisionPostId(commisionPostId);
			User user = userBO.getUserInfo(postUserId);
			
			CommisionProposalDetail commisionDetail = new CommisionProposalDetail();
			
			commisionDetail.setCommisionPost(commisionPost);
			commisionDetail.setUser(user);
			commisionDetail.setCommisionProposal(commisionProposal);
			
			commisionProposalDetail.add(commisionDetail);
		}
		return commisionProposalDetail;
	}

}
