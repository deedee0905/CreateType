package com.amita.createType.ex.individual.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.point.model.Point;

@Repository
public interface PointDAO {
	
	// 포인트 충전 insert api
	public int insertPointCharge(
			@Param("userId") int userId
			, @Param("methodOfPayment") String methodOfPayment
			, @Param("price") int price
			);
	
	// 세션에 저장된 userId를 기반으로 해당 계정이 가지고있는 point 조회하기
	public Integer selectPointByUserId(@Param("userId") int userId);
	
	// userId를 기반으로 point 테이블에서 구매/후원한 기록 List 조회하기
		public List<Point> selectPurchaseListByUserId(int userId);
		
	

}
