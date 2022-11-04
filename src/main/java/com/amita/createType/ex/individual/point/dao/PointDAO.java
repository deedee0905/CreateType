package com.amita.createType.ex.individual.point.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	
	
	

}
