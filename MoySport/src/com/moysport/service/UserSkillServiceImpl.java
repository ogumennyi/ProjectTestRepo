package com.moysport.service;

import java.util.List;

import com.moysport.dao.UserSkillDAO;
import com.moysport.model.UserSkill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserSkillServiceImpl implements UserSkillService {
	
	@Autowired
	private UserSkillDAO userskillDAO;

	@Transactional
	public void addUserskill(UserSkill userskill) {
		userskillDAO.addUserskill(userskill);
	}

	@Transactional
	public List<UserSkill> listUserskill() {
		return userskillDAO.listUserskill();
	}

	@Transactional
	public void removeUserskill(Integer id) {
		userskillDAO.removeUserskill(id);
	}

}