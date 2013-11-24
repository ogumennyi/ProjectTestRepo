package com.moysport.service;

import java.util.List;

import com.moysport.model.Gameparties;

public interface GamepartiesService {

	public void addGameparties(Gameparties gameparties);

	public List<Gameparties> listGameparties();

	public void removeGameparties(Integer id);

}
