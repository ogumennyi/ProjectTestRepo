package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Trainings;

@Repository
public class TrainingsDAOImpl implements TrainingsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainings(Trainings Trainings) {
		sessionFactory.getCurrentSession().save(Trainings);
	}

	@SuppressWarnings("unchecked")
	public List<Trainings> listTrainings() {
		return sessionFactory.getCurrentSession().createQuery("from Trainings").list();
	}

	public void removeTrainings(Integer id) {
		Trainings Trainings = (Trainings) sessionFactory.getCurrentSession().load(Trainings.class, id);
		if (null != Trainings) {
			sessionFactory.getCurrentSession().delete(Trainings);
		}
	}

}