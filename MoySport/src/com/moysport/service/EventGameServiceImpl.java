package com.moysport.service;

import java.util.List;

import com.moysport.dao.EventGameDAO;
import com.moysport.model.EventGame;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EventGameServiceImpl implements EventGameService {
	
	@Autowired
	private EventGameDAO eventgamesDAO;

	@Transactional
	public void addEventgames(EventGame eventgames) {
		eventgamesDAO.addEventgames(eventgames);
	}

	@Transactional
	public List<EventGame> listEventgames() {
		return eventgamesDAO.listEventgames();
	}
	
	@Transactional
	public EventGame viewEventgame(int idgame){
		return eventgamesDAO.viewEventgame(idgame);
	}

	@Transactional
	public void removeEventgames(Integer id) {
		eventgamesDAO.removeEventgames(id);
	}

}
