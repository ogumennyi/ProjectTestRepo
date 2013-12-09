package com.moysport.service;

import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.EventGame;

public interface EventGameService {

	//Changed by Medynskyy
	public void add(EventGame eventGame,int idevent);
	public void update(EventGame eventGame,int idevent);

	public List<EventGame> listEventgames();
	public List<EventGame> viewEventgame(int idgame);
	public void removeEventgames(Integer id);
	public EventGame get( int id );

}
