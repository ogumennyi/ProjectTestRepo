package com.moysport.service;

import java.util.ArrayList;
import java.util.List;

import com.moysport.model.EventGame;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;

public interface EventService {
	
	//Changed by Medynskyy
	public void addEvents(Event event,int idsport, int idlocation);
	
	public void updateEvent (Event event);
	public List<Event> listEvents();
	public List<Event> viewEvent(int idevent);
	public List<EventGame> eventGame(int idevent);
	public List<Gameparties> gameparties(int idevent);
	public List<Event> searchEvents(ArrayList<String> params);
	public void removeEvents(Integer id);

	
	public void add(Event event, int idlocation, int idsport);
	
}
