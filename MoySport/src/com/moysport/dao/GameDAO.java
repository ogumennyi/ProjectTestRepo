package com.moysport.dao;

import java.util.List;

import com.moysport.model.EventGame;

public interface GameDAO {

	public List<EventGame> listEventgames();
	public List<EventGame> viewEventgame(int idgame);
	
	public List<EventGame> getAll(Integer id);
	public List<EventGame> getAll();
	public EventGame get( Integer id );
	public void add(Integer idevent, EventGame eventGame);
	public void delete(Integer id);
	public void deleteAll(Integer idevent);
	public void edit(EventGame eventGame);
	 

}
