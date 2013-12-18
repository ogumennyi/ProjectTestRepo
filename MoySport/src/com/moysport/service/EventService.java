package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.EventGame;

public interface EventService {
	
	public void addEvents(Event events);
	public List<Event> listEvents();
	public Event viewEvent(int idevent);
	public List<EventGame> eventGame(int idevent);
	public List<Event> searchEvents(HashMap<String, String> params);
	public void removeEvents(Integer id);
	
	public void add(Event event, int idlocation, int idsport);
	public void delete(Integer id);
	public void update(Event event);
	public List<Event> getAll();

	public Event get( int id );	

}
