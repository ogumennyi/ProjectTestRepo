package com.moysport.service;

import java.util.List;

import com.moysport.dao.UserskillDAO;
import com.moysport.model.Userskill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserskillServiceImpl implements UserskillService {
	
	@Autowired
	private UserskillDAO userskillDAO;

	@Transactional
	public void addUserskill(Userskill userskill) {
		userskillDAO.addUserskill(userskill);
	}

	@Transactional
	public List<Userskill> listUserskill() {
		return userskillDAO.listUserskill();
	}

	@Transactional
	public void removeUserskill(Integer id) {
		userskillDAO.removeUserskill(id);
	}

}