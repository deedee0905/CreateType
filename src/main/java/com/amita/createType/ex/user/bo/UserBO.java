package com.amita.createType.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.common.EncryptUtils;
import com.amita.createType.ex.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addSingup(String loginId, String nickname, String email, String password) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertSignup(loginId, nickname, email, encryptPassword);
	}

}
