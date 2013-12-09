package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.dao.EventsDAO;
import com.moysport.model.Eventgames;
import com.moysport.model.Events;
import com.moysport.model.Gameparties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventsServiceImpl implements EventsService {

	@Autowired
	private EventsDAO eventsDAO;

	@Transactional
	public void addEvents(Events events) {
		eventsDAO.addEvents(events);
	}
	
	@Transactional
	public List<Events> listEvents() {
		return eventsDAO.listEvents();
	}
	
	@Transactional
	public List<Events> viewEvent(int idevent) {
		return eventsDAO.viewEvent(idevent);
	}
	
	@Transactional
	public List<Eventgames> eventgames(int idevent) {
		return eventsDAO.eventgames(idevent);
	}
	
	@Transactional
	public List<Gameparties> gameparties(int idevent) {
		return eventsDAO.gameparties(idevent);
	}
	
	@Transactional
	public List<Events> searchEvents(ArrayList<String> params) {
		return eventsDAO.searchEvents(params);
	}

	@Transactional
	public void removeEvents(Integer id) {
		eventsDAO.removeEvents(id);
	}

}
