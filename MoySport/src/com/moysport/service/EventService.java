package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.model.Game;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;

public interface EventService {
	
	public void addEvents(Event event);
	public void updateEvent (Event event);
	public List<Event> listEvents();
	public List<Event> viewEvent(int idevent);
	public List<Game> game(int idevent);
	public List<Gameparties> gameparties(int idevent);
	public List<Event> searchEvents(ArrayList<String> params);
	public void removeEvents(Integer id);

}
