package com.amita.createType.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.common.EncryptUtils;
import com.amita.createType.ex.individual.model.Channel;
import com.amita.createType.ex.user.dao.UserDAO;
import com.amita.createType.ex.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입 api
	public int addSingup(String loginId, String nickname, String email, String password) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertSignup(loginId, nickname, email, encryptPassword);
	}
	
	// 아이디 중복검사 api
	public boolean isIdDuplicate(String loginId) {
		
		int count = userDAO.selectCountId(loginId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	// 닉네임 중복검사 api
	public boolean isNicknameDuplicate(String nickname) {
		int count = userDAO.selectCountNickname(nickname);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	// 이메일 중복검사 api
	public boolean isEmailDuplicate(String email) {
		int count = userDAO.selectCountEmail(email);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
	// 로그인 api
	public User getUserLogin(String loginId, String password) {
		
		//암호화된 비밀번호 전달
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserIdPassword(loginId, encryptPassword);
	}
	
	public Channel getChannelUserById(int id) {
		return userDAO.selectChannelUserById(id);
	}
	
	// 유저 정보 가져오기
		public User getUserInfo(int id) {
			return userDAO.selectUserInfo(id);
		}
	

}
