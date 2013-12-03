package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Trainingweek;

@Repository
public class TrainingweekDAOImpl implements TrainingweekDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainingweek(Trainingweek trainingweek) {
		sessionFactory.getCurrentSession().save(trainingweek);
	}

	@SuppressWarnings("unchecked")
	public List<Trainingweek> listTrainingweek() {
		return sessionFactory.getCurrentSession().createQuery("from Trainingweek").list();
	}

	public void removeTrainingweek(Integer id) {
		Trainingweek trainingweek = (Trainingweek) sessionFactory.getCurrentSession().load(Trainingweek.class, id);
		if (null != trainingweek) {
			sessionFactory.getCurrentSession().delete(trainingweek);
		}
	}

}