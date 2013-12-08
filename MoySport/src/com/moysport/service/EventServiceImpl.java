package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.model.Game;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	@Transactional
	public void updateEvent(Event event) {
		eventDAO.updateEvent(event);
	}

	@Transactional
	public void addEvents(Event event) {
		eventDAO.addEvents(event);
	}
	
	@Transactional
	public List<Event> listEvents() {
		return eventDAO.listEvents();
	}
	
	@Transactional
	public List<Event> viewEvent(int idevent) {
		return eventDAO.viewEvent(idevent);
	}
	
	@Transactional
	public List<Game> game(int idevent) {
		return eventDAO.game(idevent);
	}
	
	@Transactional
	public List<Gameparties> gameparties(int idevent) {
		return eventDAO.gameparties(idevent);
	}
	
	@Transactional
	public List<Event> searchEvents(ArrayList<String> params) {
		return eventDAO.searchEvents(params);
	}

	@Transactional
	public void removeEvents(Integer id) {
		eventDAO.removeEvents(id);
	}

}
