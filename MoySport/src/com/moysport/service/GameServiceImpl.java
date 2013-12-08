package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventgamesDAO;
import com.moysport.model.Game;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	private EventgamesDAO eventgamesDAO;

	@Transactional
	public void addEventgames(Game game) {
		eventgamesDAO.addEventgames(game);
	}

	@Transactional
	public List<Game> listEventgames() {
		return eventgamesDAO.listEventgames();
	}
	
	@Transactional
	public List<Game> viewEventgame(int idgame){
		return eventgamesDAO.viewEventgame(idgame);
	}

	@Transactional
	public void removeEventgames(Integer id) {
		eventgamesDAO.removeEventgames(id);
	}

}
