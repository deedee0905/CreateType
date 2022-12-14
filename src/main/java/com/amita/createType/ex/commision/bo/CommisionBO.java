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
	
	// 신청한 커미션 포스트의 내용 select
	public CommisionProposal getCommisionPostInfoByCommisionProposalId(int commisionProposalId) {
		return commisionDAO.selectCommisionPostInfoByCommisionProposalId(commisionProposalId);
	}
	
	// 신청받은 커미션 내역서를 세션에 저장된 userId 기반으로 가져오기
	public List<CommisionProposalDetail> getCommisionProposalListByUserId(int postUserId){
		List<CommisionProposal> proposalList = commisionDAO.selectCommisionProposalListByUserId(postUserId);
		
		List<CommisionProposalDetail> proposalDetailList = new ArrayList<>();
		
		for(CommisionProposal commisionProposal : proposalList) {
			int applicantId = commisionProposal.getUserId();
			int commisionPostId = commisionProposal.getCommisionPostId();
			CommisionPost commisionPost = commisionDAO.selectCommisionPostInfoByPostId(commisionPostId);
			User user = userBO.getUserInfo(applicantId);
			
			CommisionProposalDetail proposal = new CommisionProposalDetail();
			
			proposal.setCommisionPost(commisionPost);
			proposal.setCommisionProposal(commisionProposal);
			proposal.setUser(user);
			
			proposalDetailList.add(proposal);
			
		}
		 return proposalDetailList;
	}
	
	// 신청받은 커미션의 작업 상태를 변경하는 api
	public int changeOfWorkStatus(int id, String processing) {
		return commisionDAO.updateCommisionProposalProcessingColumn(id, processing);
	}
	
	// 커미션 포스트 수정 update api
	public int commisionPostUpdate(
			int userId
			, int commisionPostId
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

		return commisionDAO.updatePost(userId, commisionPostId, title, content, category, minimumPrice, maximumPrice, deadline, question, imagePath);
	}
	
	// 커미션 포스트의 id로 commisionPost의 정보 가져오기
	public CommisionPost getCommisionPostInfoById(int id) {
		return commisionDAO.selectPostInfoByCommisionPostId(id);
	}


	// 커미션 포스트 마감(update) api
	public int commisionPostFinishUpdate(int userId, int commisionPostId, int deadline) {
		return commisionDAO.commisionPostFinishUpdate(userId, commisionPostId, deadline);
	}
	
	

}
