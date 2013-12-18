package com.moysport.dao;

import java.util.List;

import com.moysport.model.GameRating;

public interface GameRatingDAO {

	public void addGameratings(GameRating gameratings);
	
	public List<GameRating> listGameratings();
	
	public void removeGameratings(Integer id);
	
}