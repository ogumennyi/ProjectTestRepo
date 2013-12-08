package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.dao.EventsDAO;
import com.moysport.model.Game;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventsDAO eventsDAO;

	@Transactional
	public void addEvents(Event event) {
		eventsDAO.addEvents(event);
	}
	
	@Transactional
	public List<Event> listEvents() {
		return eventsDAO.listEvents();
	}
	
	@Transactional
	public List<Event> viewEvent(int idevent) {
		return eventsDAO.viewEvent(idevent);
	}
	
	@Transactional
	public List<Game> game(int idevent) {
		return eventsDAO.game(idevent);
	}
	
	@Transactional
	public List<Gameparties> gameparties(int idevent) {
		return eventsDAO.gameparties(idevent);
	}
	
	@Transactional
	public List<Event> searchEvents(ArrayList<String> params) {
		return eventsDAO.searchEvents(params);
	}

	@Transactional
	public void removeEvents(Integer id) {
		eventsDAO.removeEvents(id);
	}

}
