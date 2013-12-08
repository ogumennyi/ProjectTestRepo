package com.moysport.service;

import java.util.List;

import com.moysport.model.Training;

public interface TrainingsService {

	public void addTrainings(Training Training);

	public List<Training> listTrainings();

	public void removeTrainings(Integer id);

}
