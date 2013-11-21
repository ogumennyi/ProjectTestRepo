package com.moysport.dao;

import java.util.List;

import com.moysport.model.Eventgames;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventgamesDAOImpl implements EventgamesDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEventgames(Eventgames eventgames) {
		sessionFactory.getCurrentSession().save(eventgames);
	}

	@SuppressWarnings("unchecked")
	public List<Eventgames> listEventgames() {
		return sessionFactory.getCurrentSession().createQuery("from Eventgames").list();
	}

	public void removeEventgames(Integer id) {
		Eventgames eventgames = (Eventgames) sessionFactory.getCurrentSession().load(Eventgames.class, id);
		if (null != eventgames) {
			sessionFactory.getCurrentSession().delete(eventgames);
		}
	}

}
