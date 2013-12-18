package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.dao.EventDAO;
import com.moysport.model.Event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventsDAO;

	@Transactional
	public void addEvents(Event events) {
		eventsDAO.addEvents(events);
	}
	
	@Transactional
	public List<Event> listEvents() {
		return eventsDAO.listEvents();
	}
	
	@Transactional
	public Event viewEvent(int idevent) {
		return eventsDAO.viewEvent(idevent);
	}
	
	@Transactional
	public List<Event> searchEvents(HashMap<String, String> params) {
		return eventsDAO.searchEvents(params);
	}

	@Transactional
	public void removeEvents(Integer id) {
		eventsDAO.removeEvents(id);
	}

}
