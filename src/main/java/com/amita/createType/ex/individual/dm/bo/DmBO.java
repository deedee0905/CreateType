package com.amita.createType.ex.individual.dm.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.dm.dao.DmDAO;

@Service
public class DmBO {

	@Autowired
	private DmDAO dmDAO;
	
	// dm 메세지 insert
	public int addMessage(int userId, int userIdOthers, String message) {
		return dmDAO.insertMessage(userId, userIdOthers, message);
	}
	
}
