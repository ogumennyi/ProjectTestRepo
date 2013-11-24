package com.moysport.dao;

import java.util.List;

import com.moysport.model.Gameparties;

public interface GamepartiesDAO {

	public void addGameparties(Gameparties gameparties);

	public List<Gameparties> listGameparties();

	public void removeGameparties(Integer id);

}
