package com.moysport.service;

import java.util.List;

import com.moysport.model.EventGame;

public interface EventGameService {

	public void addEventgames(EventGame eventgames);
	public List<EventGame> listEventgames();
	public EventGame viewEventgame(int idgame);
	public void removeEventgames(Integer id);

}
