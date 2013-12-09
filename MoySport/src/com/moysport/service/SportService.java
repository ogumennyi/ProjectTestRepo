package com.moysport.service;

import java.util.List;

import com.moysport.model.Location;
import com.moysport.model.Sport;
import com.moysport.model.User;

public interface SportService {
	
	public void addSport(Sport sport);
	public List<Sport> listSport();
	public void removeSport(Integer id);
	// Added by Medynskyy. Search for Sport via sportId key 
	public Sport get(int idsport);


}
