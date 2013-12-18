package com.moysport.dao;

import java.util.List;

import com.moysport.model.TrainingWeek;

public interface TrainingWeekDAO {

	public void addTrainingweek(TrainingWeek trainingweek);
	
	public List<TrainingWeek> listTrainingweek();
	
	public void removeTrainingweek(Integer id);
	
}
