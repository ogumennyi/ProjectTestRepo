package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventgamesDAO;
import com.moysport.model.Eventgames;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventgamesServiceImpl implements EventgamesService {
	
	@Autowired
	private EventgamesDAO eventgamesDAO;

	@Transactional
	public void addEventgames(Eventgames eventgames) {
		eventgamesDAO.addEventgames(eventgames);
	}

	@Transactional
	public List<Eventgames> listEventgames() {
		return eventgamesDAO.listEventgames();
	}
	
	@Transactional
	public List<Eventgames> viewEventgame(int idgame){
		return eventgamesDAO.viewEventgame(idgame);
	}

	@Transactional
	public void removeEventgames(Integer id) {
		eventgamesDAO.removeEventgames(id);
	}

}
