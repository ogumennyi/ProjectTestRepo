package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingDAO;
import com.moysport.model.Training;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingServiceImpl implements TrainingService {
	
	@Autowired
	private TrainingDAO TrainingsDAO;

	@Transactional
	public void addTrainings(Training trainings) {
		TrainingsDAO.addTrainings(trainings);
	}

	@Transactional
	public List<Training> listTrainings() {
		return TrainingsDAO.listTrainings();
	}

	@Transactional
	public void removeTrainings(Integer id) {
		TrainingsDAO.removeTrainings(id);
	}

}