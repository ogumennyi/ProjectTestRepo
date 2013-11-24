package com.moysport.dao;

import java.util.List;

import com.moysport.model.Userskill;

public interface UserskillDAO {
	
	public void addUserskill(Userskill userskill);

	public List<Userskill> listUserskill();

	public void removeUserskill(Integer id);

}
