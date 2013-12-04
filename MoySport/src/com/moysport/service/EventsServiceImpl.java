package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventsDAO;
import com.moysport.model.Events;

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
	public void removeEvents(Integer id) {
		eventsDAO.removeEvents(id);
	}

}
