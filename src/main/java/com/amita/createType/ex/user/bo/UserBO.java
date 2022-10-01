package com.amita.createType.ex.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addSingup(String loginId, String nickname, String email, String password) {
		
		return userDAO.insertSignup(loginId, nickname, email, password);
	}

}
