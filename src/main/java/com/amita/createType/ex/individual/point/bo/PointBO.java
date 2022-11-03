package com.amita.createType.ex.individual.point.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amita.createType.ex.individual.point.dao.PointDAO;

@Service
public class PointBO {
	
	@Autowired
	private PointDAO pointDAO;
	
	public int addPointCharge(int userId, String methodOfPayment, int price) {
		return pointDAO.insertPointCharge(userId, methodOfPayment, price);
	}

}
