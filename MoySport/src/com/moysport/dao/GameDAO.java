package com.moysport.dao;

import java.util.List;

import com.moysport.model.EventGame;

public interface GameDAO {

	public void addGame(EventGame eventGame);
	public List<EventGame> listEventgames();
	public List<EventGame> viewEventgame(int idgame);
	public void removeEventgames(Integer id);

}
