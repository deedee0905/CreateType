package com.amita.createType.ex.individual.point.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.point.dao.PointDAO;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;
	
	// 포인트 충전 insert api
	public int addPointCharge(int userId, String methodOfPayment, int price) {
		return pointDAO.insertPointCharge(userId, methodOfPayment, price);
	}
	
	// 세션에 저장된 userId를 기반으로 해당 계정이 가지고있는 point 조회하기
	public int getTotalPoint(int userId) {
		return pointDAO.selectPointByUserId(userId);
	}

}
