package com.moysport.service;

import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.Game;

public interface GameService {

	//Changed by Medynskyy
	public void addGame(Game game,int idevent);
	
	public List<Game> listEventgames();
	public List<Game> viewEventgame(int idgame);
	public void removeEventgames(Integer id);

}
