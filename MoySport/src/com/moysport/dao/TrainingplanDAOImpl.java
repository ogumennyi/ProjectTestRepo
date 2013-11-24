package com.moysport.dao;

import java.util.List;

import com.moysport.model.Trainingplan;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TrainingplanDAOImpl  implements TrainingplanDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainingplan(Trainingplan trainingplan) {
		sessionFactory.getCurrentSession().save(trainingplan);
	}

	@SuppressWarnings("unchecked")
	public List<Trainingplan> listTrainingplan() {
		return sessionFactory.getCurrentSession().createQuery("from Trainingplan").list();
	}

	public void removeTrainingplan(Integer id) {
		Trainingplan trainingplan = (Trainingplan) sessionFactory.getCurrentSession().load(Trainingplan.class, id);
		if (null != trainingplan) {
			sessionFactory.getCurrentSession().delete(trainingplan);
		}
	}

}
