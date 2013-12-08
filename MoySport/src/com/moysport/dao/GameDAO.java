package com.moysport.dao;

import java.util.List;

import com.moysport.model.Game;

public interface GameDAO {

	public void addGame(Game game);
	public List<Game> listEventgames();
	public List<Game> viewEventgame(int idgame);
	public void removeEventgames(Integer id);

}
