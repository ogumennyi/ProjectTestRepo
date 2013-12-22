package com.moysport.dao;

import java.util.List;

import com.moysport.model.EventGame;

public interface EventGameDAO {

	public void addEventgames(EventGame eventgames);
	public List<EventGame> listEventgames();
	public EventGame viewEventgame(int idgame);
	public void removeEventgames(Integer id);
	
	public List<EventGame> getAll(Integer idEvent);
	public List<EventGame> getAll();
	public void add(EventGame eventGame);
	public void delete(Integer id);
	public void deleteAll(Integer idevent);
	public void update(EventGame eventGame);
	 
	public EventGame get(int idGame);
	
}
