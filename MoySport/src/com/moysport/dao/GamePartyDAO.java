package com.moysport.dao;

import java.util.List;

import com.moysport.model.GameParty;

public interface GamePartyDAO {

	public void addGameparties(GameParty gameparties);
	public List<GameParty> listGameparties();
	public List<GameParty> listGameparties(int idgame);
	public void removeGameparties(Integer id);

}
