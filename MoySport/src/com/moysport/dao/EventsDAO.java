package com.moysport.dao;

import java.util.ArrayList;
import java.util.List;

import com.moysport.model.Events;

public interface EventsDAO {

	public void addEvents(Events events);
	public List<Events> listEvents();
	public List<Events> viewEvent(int idevent);
	public List<Events> searchEvents(ArrayList<String> params);
	public void removeEvents(Integer id);

}
