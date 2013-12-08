package com.moysport.service;

import java.util.List;

import com.moysport.model.Game;

public interface GameService {

	public void addEventgames(Game game);
	public List<Game> listEventgames();
	public List<Game> viewEventgame(int idgame);
	public void removeEventgames(Integer id);

}
