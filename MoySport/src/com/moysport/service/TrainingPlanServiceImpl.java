package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingPlanDAO;
import com.moysport.model.TrainingPlan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingPlanServiceImpl  implements TrainingPlanService {
	
	@Autowired
	private TrainingPlanDAO trainingplanDAO;

	@Transactional
	public void addTrainingplan(TrainingPlan trainingplan) {
		trainingplanDAO.addTrainingplan(trainingplan);
	}

	@Transactional
	public List<TrainingPlan> listTrainingplan() {
		return trainingplanDAO.listTrainingplan();
	}

	@Transactional
	public void removeTrainingplan(Integer id) {
		trainingplanDAO.removeTrainingplan(id);
	}

}