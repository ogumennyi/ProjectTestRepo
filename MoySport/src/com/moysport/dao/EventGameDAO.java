package com.moysport.dao;

import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.EventGame;

public interface EventGameDAO {

	public List<EventGame> listEventgames();
	public List<EventGame> viewEventgame(int idgame);
	
	public List<EventGame> getAll(Integer id);
	public List<EventGame> getAll();
	public void add(EventGame eventGame);
	public void delete(Integer id);
	public void deleteAll(Integer idevent);
	public void update(EventGame eventGame);
	 
	public EventGame get(int idevent);


}
