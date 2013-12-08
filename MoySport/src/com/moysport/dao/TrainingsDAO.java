package com.moysport.dao;

import java.util.List;

import com.moysport.model.Training;

public interface TrainingsDAO {

	public void addTrainings(Training events);
	
	public List<Training> listTrainings();
	
	public void removeTrainings(Integer id);
	
}
