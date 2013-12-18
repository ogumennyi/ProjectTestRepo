package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingWeekDAO;
import com.moysport.model.TrainingWeek;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingWeekServiceImpl implements TrainingWeekService {
	
	@Autowired
	private TrainingWeekDAO TrainingweekDAO;

	@Transactional
	public void addTrainingweek(TrainingWeek trainingweek) {
		TrainingweekDAO.addTrainingweek(trainingweek);
	}

	@Transactional
	public List<TrainingWeek> listTrainingweek() {
		return TrainingweekDAO.listTrainingweek();
	}

	@Transactional
	public void removeTrainingweek(Integer id) {
		TrainingweekDAO.removeTrainingweek(id);
	}
}
