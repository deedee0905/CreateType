package com.amita.createType.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.common.EncryptUtils;
import com.amita.createType.ex.user.dao.UserDAO;

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
	

}
