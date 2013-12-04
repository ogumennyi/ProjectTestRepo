package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingweekDAO;
import com.moysport.model.Trainingweek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingweekServiceImpl implements TrainingweekService {
	
	@Autowired
	private TrainingweekDAO TrainingweekDAO;

	@Transactional
	public void addTrainingweek(Trainingweek trainingweek) {
		TrainingweekDAO.addTrainingweek(trainingweek);
	}

	@Transactional
	public List<Trainingweek> listTrainingweek() {
		return TrainingweekDAO.listTrainingweek();
	}

	@Transactional
	public void removeTrainingweek(Integer id) {
		TrainingweekDAO.removeTrainingweek(id);
	}
}
