package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Gameratings;

@Repository
public class GameratingsDAOImpl implements GameratingsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addGameratings(Gameratings Gameratings) {
		sessionFactory.getCurrentSession().save(Gameratings);
	}

	@SuppressWarnings("unchecked")
	public List<Gameratings> listGameratings() {
		return sessionFactory.getCurrentSession().createQuery("from Gameratings").list();
	}

	public void removeGameratings(Integer id) {
		Gameratings Gameratings = (Gameratings) sessionFactory.getCurrentSession().load(Gameratings.class, id);
		if (null != Gameratings) {
			sessionFactory.getCurrentSession().delete(Gameratings);
		}
	}

}