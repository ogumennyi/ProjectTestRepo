package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.model.Eventgames;
import com.moysport.model.Events;
import com.moysport.model.Gameparties;

public interface EventsService {
	
	public void addEvents(Events events);
	public List<Events> listEvents();
	public List<Events> viewEvent(int idevent);
	public List<Eventgames> eventgames(int idevent);
	public List<Gameparties> gameparties(int idevent);
	public List<Events> searchEvents(ArrayList<String> params);
	public void removeEvents(Integer id);

}
