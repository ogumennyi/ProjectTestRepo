package com.moysport.dao;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;

public interface EventDAO {

	public List<Event> listEvents();
	public List<Event> listEvents(HashMap<String, String> params);
	public Event getEvent(int idevent);
	public void addEvent(Event event);
	public void updateEvent(Event event);
	public void deleteEvent(Integer id);

}
