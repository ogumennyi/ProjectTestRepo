package com.moysport.service;

import java.util.List;

import com.moysport.dao.TrainingplanDAO;
import com.moysport.model.Trainingplan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainingplanServiceImpl  implements TrainingplanService {
	
	@Autowired
	private TrainingplanDAO trainingplanDAO;

	@Transactional
	public void addTrainingplan(Trainingplan trainingplan) {
		trainingplanDAO.addTrainingplan(trainingplan);
	}

	@Transactional
	public List<Trainingplan> listTrainingplan() {
		return trainingplanDAO.listTrainingplan();
	}

	@Transactional
	public void removeTrainingplan(Integer id) {
		trainingplanDAO.removeTrainingplan(id);
	}

}