package com.moysport.service;

import java.util.List;

import com.moysport.model.TrainingPlan;

public interface TrainingPlanService {
	
	public void addTrainingplan(TrainingPlan trainingplan);

	public List<TrainingPlan> listTrainingplan();

	public void removeTrainingplan(Integer id);

}
