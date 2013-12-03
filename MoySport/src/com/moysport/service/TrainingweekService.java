package com.moysport.service;

import java.util.List;

import com.moysport.model.Trainingweek;

public interface TrainingweekService {

	public void addTrainingweek(Trainingweek trainingweek);

	public List<Trainingweek> listTrainingweek();

	public void removeTrainingweek(Integer id);

}
