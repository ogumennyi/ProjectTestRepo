package com.moysport.service;

import java.util.List;

import com.moysport.model.UserSkill;

public interface UserSkillService {

	public void addUserskill(UserSkill userskill);

	public List<UserSkill> listUserskill();

	public void removeUserskill(Integer id);

}
