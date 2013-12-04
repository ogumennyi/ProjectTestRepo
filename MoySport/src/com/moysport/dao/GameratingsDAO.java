package com.moysport.dao;

import java.util.List;

import com.moysport.model.Gameratings;

public interface GameratingsDAO {

	public void addGameratings(Gameratings gameratings);
	
	public List<Gameratings> listGameratings();
	
	public void removeGameratings(Integer id);
	
}