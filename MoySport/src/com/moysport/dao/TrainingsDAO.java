package com.moysport.dao;

import java.util.List;

import com.moysport.model.Trainings;

public interface TrainingsDAO {

	public void addTrainings(Trainings events);
	
	public List<Trainings> listTrainings();
	
	public void removeTrainings(Integer id);
	
}
