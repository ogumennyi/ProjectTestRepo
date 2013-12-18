package com.moysport.dao;

import java.util.List;

import com.moysport.model.UserSkill;

public interface UserSkillDAO {
	
	public void addUserskill(UserSkill userskill);

	public List<UserSkill> listUserskill();

	public void removeUserskill(Integer id);

}
