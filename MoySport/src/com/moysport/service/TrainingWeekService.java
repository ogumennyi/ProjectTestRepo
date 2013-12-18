package com.moysport.service;

import java.util.List;

import com.moysport.model.TrainingWeek;

public interface TrainingWeekService {

	public void addTrainingweek(TrainingWeek trainingweek);

	public List<TrainingWeek> listTrainingweek();

	public void removeTrainingweek(Integer id);

}
