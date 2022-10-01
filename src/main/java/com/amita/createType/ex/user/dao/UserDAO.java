package com.amita.createType.ex.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public int insertSignup(
			@Param("loginId") String loginId
			, @Param("nickname") String nickname
			, @Param("email") String email
			, @Param("password") String password
			);
	
	public int selectCountId(@Param("loginId") String loginId);
	
	public int selectCountNickname(@Param("nickname") String nickname);

}
