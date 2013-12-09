package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.GamepartiesDAO;
import com.moysport.model.Gameparties;

@Service
public class GamepartiesServiceImpl implements GamepartiesService {

	@Autowired
	private GamepartiesDAO gamepartiesDAO;

	@Transactional
	public void addGameparties(Gameparties gameparties) {
		gamepartiesDAO.addGameparties(gameparties);
	}

	@Transactional
	public List<Gameparties> listGameparties() {
		return gamepartiesDAO.listGameparties();
	}
	
	@Transactional
	public List<Gameparties> listGameparties(int idgame) {
		return gamepartiesDAO.listGameparties(idgame);
	}

	@Transactional
	public void removeGameparties(Integer id) {
		gamepartiesDAO.removeGameparties(id);
	}

}