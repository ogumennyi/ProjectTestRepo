package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.dao.LocationDAO;
import com.moysport.dao.SportDAO;
import com.moysport.model.Event;
import com.moysport.model.EventGame;
import com.moysport.model.Location;
import com.moysport.model.Sport;

import org.hibernate.Hibernate;
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
	public void addEvents(Event events) {
		eventDAO.addEvent(events);
	}

	@Transactional
	public List<Event> listEvents() {
		return eventDAO.listEvents();
	}

	@Transactional
	public List<Event> searchEvents() {
		List<Event> eventsList = eventDAO.listEvents();
		for (Event event : eventsList) {
			Hibernate.initialize(event.getEventgames());
			for (EventGame eventgames : event.getEventgames()) {
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}

	@Transactional
	public List<Event> searchEvents(HashMap<String, String> params) {
		List<Event> eventsList = eventDAO.listEvents(params);
		for (Event event : eventsList) {
			Hibernate.initialize(event.getEventgames());
			for (EventGame eventgames : event.getEventgames()) {
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}	

	@Transactional
	public Event getEvent(int idevent) {
		return eventDAO.getEvent(idevent);
	}
	
	@Transactional
	public Event getEventWithParties(int idevent) {
		Event event = eventDAO.getEvent(idevent);
		Hibernate.initialize(event.getEventgames());
		for (EventGame eventgames : event.getEventgames()) {
			Hibernate.initialize(eventgames.getGameparties());
		}
		return event;
	}

	@Transactional
	public void deleteEvent(Integer id) {
		eventDAO.deleteEvent(id);
	}

	@Transactional
	public void addEvents(Event event, int idsport, int idlocation) {
		// TODO Auto-generated method stub
	}

	@Transactional
	public void add(Event event, int idlocation, int idsport) {
		Location location = locationDAO.getLocationId(idlocation);
		Sport sport = sportDAO.getSportId(idsport);
		event.setLocations(location);
		event.setSport(sport);
		eventDAO.addEvent(event);
	}

	@Transactional
	public void delete(Integer id) {
		// TODO Auto-generated method stub

	}

	@Transactional
	public void updateEvent(Event event) {
		eventDAO.updateEvent(event);
	}

	@Transactional
	public List<Event> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
