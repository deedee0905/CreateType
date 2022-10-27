package com.amita.createType.ex.individual.dm.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.dm.dao.DmDAO;
import com.amita.createType.ex.individual.dm.model.DM;

@Service
public class DmBO {

	@Autowired
	private DmDAO dmDAO;
	
	// dm 메세지 insert
	public int addMessage(int userId, int userIdOthers, String message) {
		return dmDAO.insertMessage(userId, userIdOthers, message);
	}
	
	// dm 메세지 읽어오기
	public List<DM> getDMlist(int userId, int userIdOthers){
		return dmDAO.selectMessageList(userId, userIdOthers);
	}
	
	
}
