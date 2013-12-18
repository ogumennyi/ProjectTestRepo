package com.moysport.dao;

import java.util.List;

import com.moysport.model.Sport;

public interface SportDAO {

	public void addSport(Sport sport);
	public List<Sport> listSport();
	public void removeSport(Integer id);
	public Sport getSportId(int idsport);
	
}
