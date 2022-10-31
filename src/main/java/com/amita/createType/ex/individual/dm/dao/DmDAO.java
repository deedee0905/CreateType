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
	
	// dm 메세지 리스트를 읽어오기
	public List<DM> selectMessageList(
			@Param("userId") int userId
			, @Param("userIdOthers") int userIdOthers
			);
	

	
	// userId로 userIdOthers 숫자를 가져오기
	public List<DM> selectDms(@Param("userId") int userId);
	
	// 특정 dm 메세지 delete
	public int deleteDmMessage(
			@Param("userId") int userId
			, @Param("id") int id
			);
	

}
