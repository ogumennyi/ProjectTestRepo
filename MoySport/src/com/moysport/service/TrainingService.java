package com.moysport.service;

import java.util.List;

import com.moysport.model.Training;

public interface TrainingService {

	public void addTrainings(Training Trainings);

	public List<Training> listTrainings();

	public void removeTrainings(Integer id);

}
