package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingsDAO;
import com.moysport.model.Trainings;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingsServiceImpl implements TrainingsService {
	
	@Autowired
	private TrainingsDAO TrainingsDAO;

	@Transactional
	public void addTrainings(Trainings trainings) {
		TrainingsDAO.addTrainings(trainings);
	}

	@Transactional
	public List<Trainings> listTrainings() {
		return TrainingsDAO.listTrainings();
	}

	@Transactional
	public void removeTrainings(Integer id) {
		TrainingsDAO.removeTrainings(id);
	}

}