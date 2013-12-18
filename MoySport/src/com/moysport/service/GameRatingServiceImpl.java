package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.GameRatingDAO;
import com.moysport.model.GameRating;

@Service
public class GameRatingServiceImpl implements GameRatingService {
	
	@Autowired
	private GameRatingDAO GameratingsDAO;

	@Transactional
	public void addGameratings(GameRating Gameratings) {
		GameratingsDAO.addGameratings(Gameratings);
	}

	@Transactional
	public List<GameRating> listGameratings() {
		return GameratingsDAO.listGameratings();
	}

	@Transactional
	public void removeGameratings(Integer id) {
		GameratingsDAO.removeGameratings(id);
	}

}