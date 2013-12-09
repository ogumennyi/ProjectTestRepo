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
	
	@Transactional
	public EventGame get( int idevent ){
		return eventGameDAO.get(idevent);
	}
	

	
	@Transactional
	public void add(EventGame eventGame,int idevent) {
		Event event = eventDAO.get(idevent);
		eventGame.setEvents(event);
		eventGameDAO.add(eventGame);
	}	  
	
	
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


	@Transactional
	public void update(EventGame eventGame, int idevent) {
		// TODO Auto-generated method stub
		eventGameDAO.update(eventGame);
	}

}
