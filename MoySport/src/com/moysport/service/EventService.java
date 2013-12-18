package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;

public interface EventService {
	
	public void addEvents(Event events);
	public List<Event> listEvents();
	public Event viewEvent(int idevent);
	public List<Event> searchEvents(HashMap<String, String> params);
	public void removeEvents(Integer id);

}
