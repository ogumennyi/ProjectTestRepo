package com.moysport.service;

import java.util.List;

import com.moysport.model.GameRating;

public interface GameRatingService {

	public void addGameratings(GameRating Gameratings);

	public List<GameRating> listGameratings();

	public void removeGameratings(Integer id);

}
