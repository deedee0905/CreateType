package com.amita.createType.ex.individual.dm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.dm.model.DM;

@Repository
public interface DmDAO {

	
	// dm message insert
	public int insertMessage(
			@Param("userId") int userId
			, @Param("userIdOthers") int userIdOthers
			, @Param("message") String message
			);
	
	// dm 메세지 읽어오기
	public List<DM> selectMessageList(
			@Param("userId") int userId
			, @Param("userIdOthers") int userIdOthers
			);

}
