package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.GamePartyDAO;
import com.moysport.model.GameParty;

@Service
public class GamePartyServiceImpl implements GamePartyService {

	@Autowired
	private GamePartyDAO gamepartiesDAO;

	@Transactional
	public void addGameparties(GameParty gameparties) {
		gamepartiesDAO.addGameparties(gameparties);
	}

	@Transactional
	public List<GameParty> listGameparties() {
		return gamepartiesDAO.listGameparties();
	}
	
	@Transactional
	public List<GameParty> listGameparties(int idgame) {
		return gamepartiesDAO.listGameparties(idgame);
	}

	@Transactional
	public void removeGameparties(Integer id) {
		gamepartiesDAO.removeGameparties(id);
	}

}