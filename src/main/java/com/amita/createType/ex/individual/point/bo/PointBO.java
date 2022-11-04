package com.amita.createType.ex.individual.point.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.point.dao.PointDAO;
import com.amita.createType.ex.individual.point.model.Point;
import com.amita.createType.ex.individual.point.model.PointDetail;
import com.amita.createType.ex.post.bo.PostBO;
import com.amita.createType.ex.post.model.Post;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	// 포인트 충전 insert api
	public int addPointCharge(int userId, String methodOfPayment, int price) {
		return pointDAO.insertPointCharge(userId, methodOfPayment, price);
	}
	
	// 세션에 저장된 userId를 기반으로 해당 계정이 가지고있는 point 조회하기
	public Integer getTotalPoint(int userId) {
		return pointDAO.selectPointByUserId(userId);
	}
	
	// userId를 기반으로 point 테이블에서 구매/후원한 기록 List 조회하기
		public List<PointDetail> getPurchaseList(int userId){
			List<Point> purchaseList = pointDAO.selectPurchaseListByUserId(userId);
			
			List<PointDetail> purchaseDetailList = new ArrayList<>();
			
			for(Point point : purchaseList) {
				int postId = point.getPostId();
				Post post = postBO.getPost(postId);
				int writerId = post.getUserId();
				User user = userBO.getUserInfo(writerId);
				
				PointDetail pointDetail = new PointDetail();
				
				pointDetail.setPoint(point);
				pointDetail.setPost(post);
				pointDetail.setUser(user);
				
				purchaseDetailList.add(pointDetail);
			}
			return purchaseDetailList;
		}
		
		// channelId를 기반으로 로그인한 사용자가 발행한 게시글의 판매/후원 내역을 가져오기
		public List<PointDetail> getRevenueList(int channelId){
			List<Point> revenueList = pointDAO.selectRevenueListByChannelId(channelId);
			
			List<PointDetail> revenueDetailList = new ArrayList<>();
			for(Point point : revenueList) {
				int postId = point.getPostId();
				int purchaserId = point.getUserId();
				Post post = postBO.getPost(postId);
				User user = userBO.getUserInfo(purchaserId);
				
				PointDetail pointDetail = new PointDetail();
				
				pointDetail.setPoint(point);
				pointDetail.setPost(post);
				pointDetail.setUser(user);
				
				revenueDetailList.add(pointDetail);
			}
			return revenueDetailList;
		}
		
		// 세션에 저장된 channelId를 기반으로 해당 계정이 가지고있는 포인트 수익 조회하기
		public Integer getTotalrevenue(int channelId) {
			return pointDAO.selectRevenueByChannelId(channelId);
		}
		
		// 출금 api
		public int pointWithdraw(int userId, String methodOfPayment, int price, int channelId) {
			return pointDAO.insertPointWithdraw(userId, methodOfPayment, price, channelId);
		}
		

}
