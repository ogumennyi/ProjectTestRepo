package com.moysport.dao;

import java.util.List;

import com.moysport.model.Eventgames;

public interface EventgamesDAO {

	public void addEventgames(Eventgames eventgames);

	public List<Eventgames> listEventgames();

	public void removeEventgames(Integer id);

}
