package com.moysport.service;

import java.util.List;

import com.moysport.model.Trainings;

public interface TrainingsService {

	public void addTrainings(Trainings Trainings);

	public List<Trainings> listTrainings();

	public void removeTrainings(Integer id);

}
