package com.moysport.dao;

import java.util.List;

import com.moysport.model.Trainingplan;

public interface TrainingplanDAO {
	
	public void addTrainingplan(Trainingplan trainingplan);

	public List<Trainingplan> listTrainingplan();

	public void removeTrainingplan(Integer id);


}
