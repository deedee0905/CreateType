package com.amita.createType.ex.individual.point.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PointDAO {
	
	public int insertPointCharge(
			@Param("userId") int userId
			, @Param("methodOfPayment") String methodOfPayment
			, @Param("price") int price
			);

}
