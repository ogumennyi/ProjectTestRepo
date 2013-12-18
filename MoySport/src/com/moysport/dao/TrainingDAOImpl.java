package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Training;

@Repository
public class TrainingDAOImpl implements TrainingDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainings(Training Trainings) {
		sessionFactory.getCurrentSession().save(Trainings);
	}

	@SuppressWarnings("unchecked")
	public List<Training> listTrainings() {
		return sessionFactory.getCurrentSession().createQuery("from Training").list();
	}

	public void removeTrainings(Integer id) {
		Training Trainings = (Training) sessionFactory.getCurrentSession().load(Training.class, id);
		if (null != Trainings) {
			sessionFactory.getCurrentSession().delete(Trainings);
		}
	}

}