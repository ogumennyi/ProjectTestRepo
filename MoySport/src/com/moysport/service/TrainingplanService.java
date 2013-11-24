package com.moysport.service;

import java.util.List;

import com.moysport.model.Trainingplan;

public interface TrainingplanService {
	
	public void addTrainingplan(Trainingplan trainingplan);

	public List<Trainingplan> listTrainingplan();

	public void removeTrainingplan(Integer id);

}
