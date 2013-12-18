package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.TrainingWeek;

@Repository
public class TrainingWeekDAOImpl implements TrainingWeekDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainingweek(TrainingWeek trainingweek) {
		sessionFactory.getCurrentSession().save(trainingweek);
	}

	@SuppressWarnings("unchecked")
	public List<TrainingWeek> listTrainingweek() {
		return sessionFactory.getCurrentSession().createQuery("from TrainingWeek").list();
	}

	public void removeTrainingweek(Integer id) {
		TrainingWeek trainingweek = (TrainingWeek) sessionFactory.getCurrentSession().load(TrainingWeek.class, id);
		if (null != trainingweek) {
			sessionFactory.getCurrentSession().delete(trainingweek);
		}
	}

}