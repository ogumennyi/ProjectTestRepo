package com.moysport.service;

import java.util.List;

import com.moysport.model.Eventgames;

public interface EventgamesService {

	public void addEventgames(Eventgames eventgames);

	public List<Eventgames> listEventgames();

	public void removeEventgames(Integer id);

}
