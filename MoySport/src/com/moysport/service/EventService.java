package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;

public interface EventService {
	
	public void addEvents(Event events);
	public List<Event> listEvents();
	public List<Event> searchEvents();
	public List<Event> searchEvents(HashMap<String, String> params);
	
	public void add(Event event, int idlocation, int idsport);
	public void deleteEvent(Integer id);
	public void updateEvent(Event event);
	public List<Event> getAll();

	public Event getEvent( int id );
	public Event getEventWithParties( int id );

}
