package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.GameratingsDAO;
import com.moysport.model.Gameratings;

@Service
public class GameratingsServiceImpl implements GameratingsService {
	
	@Autowired
	private GameratingsDAO GameratingsDAO;

	@Transactional
	public void addGameratings(Gameratings Gameratings) {
		GameratingsDAO.addGameratings(Gameratings);
	}

	@Transactional
	public List<Gameratings> listGameratings() {
		return GameratingsDAO.listGameratings();
	}

	@Transactional
	public void removeGameratings(Integer id) {
		GameratingsDAO.removeGameratings(id);
	}

}