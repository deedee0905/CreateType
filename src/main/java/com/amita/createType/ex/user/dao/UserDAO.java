package com.amita.createType.ex.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertSignup(
			@Param("loginId") String loginId
			, @Param("nickname") String nickname
			, @Param("email") String email
			, @Param("password") String password
			);
	
	// 회원가입 아이디 중복검사
	public int selectCountId(@Param("loginId") String loginId);
	
	// 회원가입 닉네임 중복검사
	public int selectCountNickname(@Param("nickname") String nickname);
	
	// 회원가입 이메일 중복검사
	public int selectCountEmail(@Param("email") String email);
	
	// 로그인 기능
	public User selectUserIdPassword(@Param("loginId") String loginId, @Param("password") String password);
	
	public Channel selectChannelUserById(@Param("userId") int userId);
	
	// 유저 정보 가져오기 select
	public User selectUserInfo(@Param("id") int id);

	

}
