package com.amita.createType.ex.individual.dm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DmDAO {

	
	// dm message insert
	public int insertMessage(
			@Param("userId") int userId
			, @Param("userIdOthers") int userIdOthers
			, @Param("message") String message
			);

}
