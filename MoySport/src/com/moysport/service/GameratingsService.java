package com.moysport.service;

import java.util.List;

import com.moysport.model.Gameratings;

public interface GameratingsService {

	public void addGameratings(Gameratings Gameratings);

	public List<Gameratings> listGameratings();

	public void removeGameratings(Integer id);

}
