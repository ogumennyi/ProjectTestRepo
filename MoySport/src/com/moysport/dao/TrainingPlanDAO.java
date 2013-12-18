package com.moysport.dao;

import java.util.List;

import com.moysport.model.TrainingPlan;

public interface TrainingPlanDAO {
	
	public void addTrainingplan(TrainingPlan trainingplan);

	public List<TrainingPlan> listTrainingplan();

	public void removeTrainingplan(Integer id);


}
