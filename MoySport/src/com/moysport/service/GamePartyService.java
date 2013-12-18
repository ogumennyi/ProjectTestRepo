package com.moysport.service;

import java.util.List;

import com.moysport.model.GameParty;

public interface GamePartyService {

	public void addGameparties(GameParty gameparties);
	public List<GameParty> listGameparties();
	public List<GameParty> listGameparties(int idgame);
	public void removeGameparties(Integer id);

}
