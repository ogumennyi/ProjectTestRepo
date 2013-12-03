package com.moysport.dao;

import java.util.List;

import com.moysport.model.Trainingweek;

public interface TrainingweekDAO {

	public void addTrainingweek(Trainingweek trainingweek);
	
	public List<Trainingweek> listTrainingweek();
	
	public void removeTrainingweek(Integer id);
	
}
