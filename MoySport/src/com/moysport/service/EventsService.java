package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Events;

public interface EventsService {
	
	public void addEvents(Events events);
	public List<Events> listEvents();
	public Events viewEvent(int idevent);
	public List<Events> searchEvents(HashMap<String, String> params);
	public void removeEvents(Integer id);

}
