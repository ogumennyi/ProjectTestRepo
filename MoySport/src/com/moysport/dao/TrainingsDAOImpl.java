package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Training;

@Repository
public class TrainingsDAOImpl implements TrainingsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addTrainings(Training Training) {
		sessionFactory.getCurrentSession().save(Training);
	}

	@SuppressWarnings("unchecked")
	public List<Training> listTrainings() {
		return sessionFactory.getCurrentSession().createQuery("from Training").list();
	}

	public void removeTrainings(Integer id) {
		Training Training = (Training) sessionFactory.getCurrentSession().load(Training.class, id);
		if (null != Training) {
			sessionFactory.getCurrentSession().delete(Training);
		}
	}

}