package com.amita.createType.ex.individual.dm.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.dm.dao.DmDAO;
import com.amita.createType.ex.individual.dm.model.DM;
import com.amita.createType.ex.individual.dm.model.DmDetail;
import com.amita.createType.ex.user.bo.UserBO;
import com.amita.createType.ex.user.model.User;

@Service
public class DmBO {

	@Autowired
	private DmDAO dmDAO;
	
	@Autowired
	private UserBO userBO;
	
	// dm 메세지 insert
	public int addMessage(int userId, int userIdOthers, String message) {
		return dmDAO.insertMessage(userId, userIdOthers, message);
	}
	
	// dm 메세지 내역을 리스트로 읽어오기
	public List<DM> getDmList(int userId, int userIdOthers){
		return dmDAO.selectMessageList(userId, userIdOthers);
	}

	
	// 유저 - 유저 메세지의 유뮤를 읽어오기
	public List<DmDetail> getDms(int userId){
		List<DM> dmList = dmDAO.selectDms(userId);
		
		List<DmDetail> dmDetailList = new ArrayList<>();
		for(DM dm : dmList) {
			int userNumber = dm.getUserIdOthers();
			User user = userBO.getUserInfo(userNumber);
			
			DmDetail detail = new DmDetail();
			detail.setDm(dm);
			detail.setUser(user);
			
			dmDetailList.add(detail);
		}
		
		return dmDetailList;
	}
	
	
	
}
