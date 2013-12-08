package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.dao.LocationDAO;
import com.moysport.dao.SportDAO;
import com.moysport.dao.GameDAO;

import com.moysport.model.Event;
import com.moysport.model.Game;
import com.moysport.model.Location;
import com.moysport.model.Sport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameServiceImpl implements GameService {
	

	@Autowired
	private GameDAO gameDAO;
	@Autowired
	private EventDAO eventDAO;

	// Changed by Medynskyy
	@Transactional
	public void addGame(Game game,int idevent) {
		Event event = eventDAO.getEventId(idevent);
		game.setEvents(event);
		gameDAO.addGame(game);
	}
	
	@Transactional
	public List<Game> listEventgames() {
		return gameDAO.listEventgames();
	}
	
	@Transactional
	public List<Game> viewEventgame(int idgame){
		return gameDAO.viewEventgame(idgame);
	}

	@Transactional
	public void removeEventgames(Integer id) {
		gameDAO.removeEventgames(id);
	}

}
