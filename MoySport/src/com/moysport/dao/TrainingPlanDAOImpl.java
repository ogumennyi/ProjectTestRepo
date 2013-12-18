package com.moysport.dao;

import java.util.List;

import com.moysport.model.TrainingPlan;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TrainingPlanDAOImpl  implements TrainingPlanDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainingplan(TrainingPlan trainingplan) {
		sessionFactory.getCurrentSession().save(trainingplan);
	}

	@SuppressWarnings("unchecked")
	public List<TrainingPlan> listTrainingplan() {
		return sessionFactory.getCurrentSession().createQuery("from TrainingPlan").list();
	}

	public void removeTrainingplan(Integer id) {
		TrainingPlan trainingplan = (TrainingPlan) sessionFactory.getCurrentSession().load(TrainingPlan.class, id);
		if (null != trainingplan) {
			sessionFactory.getCurrentSession().delete(trainingplan);
		}
	}

}
