package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.dao.LocationDAO;
import com.moysport.dao.SportDAO;
import com.moysport.dao.EventGameDAO;

import com.moysport.model.Event;
import com.moysport.model.EventGame;
import com.moysport.model.Location;
import com.moysport.model.Sport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventGameServiceImpl implements EventGameService {
	

	@Autowired
	private EventGameDAO eventGameDAO;
	@Autowired
	private EventDAO eventDAO;

	// Changed by Medynskyy
	@Transactional
	public void addGame(EventGame eventGame,int idevent) {
		Event event = eventDAO.getEventId(idevent);
		eventGame.setEvents(event);
	//	eventGameDAO.addGame(eventGame);
	}
	
	///@Transactional
	//public EventGame getGame(int idgame) {
		//EventGame game = eventGameDAO.getGameId(idgame);
		//game.s(event);
	//	eventGameDAO.viewEventgame(idgame)
	//	eventGameDAO.addGame(game);
	//}
	
	
	@Transactional
	public List<EventGame> listEventgames() {
		return eventGameDAO.listEventgames();
	}
	
	@Transactional
	public List<EventGame> viewEventgame(int idgame){
		return eventGameDAO.viewEventgame(idgame);
	}

	@Transactional
	public void removeEventgames(Integer id) {
		//eventGameDAO.removeEventgames(id);
	}

}
