package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.dao.LocationDAO;
import com.moysport.dao.SportDAO;
import com.moysport.model.EventGame;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;
import com.moysport.model.Location;
import com.moysport.model.Sport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private LocationDAO locationDAO;
	@Autowired
	private SportDAO sportDAO;


	@Transactional
	public void updateEvent(Event event) {
		eventDAO.updateEvent(event);
	}

	// Changed by Medynskyy
	@Transactional
	public void addEvents(Event event,int idsport, int idlocation) {
		Location location = locationDAO.getLocationId(idlocation);
		Sport sport = sportDAO.getSportId(idsport);
		event.setLocations(location);
		event.setSport(sport);
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
	public List<EventGame> eventGame(int idevent) {
		return eventDAO.eventGame(idevent);
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
