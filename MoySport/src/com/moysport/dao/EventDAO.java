package com.moysport.dao;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.EventGame;

public interface EventDAO {

	public void addEvents(Event events);
	public List<Event> listEvents();
	public Event viewEvent(int idevent);
	public List<EventGame> eventGame(int idevent);
	public List<Event> searchEvents(HashMap<String, String> params);
	public void removeEvents(Integer id);
	
	public Event get(int idevent);
	public void add(Event event);
	public void delete(Integer id);
	public void update(Event event);
	public List<Event> getAll();	

}
