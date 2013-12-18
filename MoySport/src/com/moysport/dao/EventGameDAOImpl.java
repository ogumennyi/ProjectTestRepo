package com.moysport.dao;

import java.util.List;

import com.moysport.model.EventGame;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventGameDAOImpl implements EventGameDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEventgames(EventGame eventgames) {
		sessionFactory.getCurrentSession().save(eventgames);
	}

	@SuppressWarnings("unchecked")
	public List<EventGame> listEventgames() {
		return sessionFactory.getCurrentSession().createQuery("from Eventgames").list();
	}
	
	public EventGame viewEventgame(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Eventgames where idgame=:idgame");
		query.setParameter("idgame",idgame);
		EventGame eventgames = (EventGame)query.list().get(0);
		Hibernate.initialize(eventgames.getGameparties());
		return eventgames;
	}

	public void removeEventgames(Integer id) {
		EventGame eventgames = (EventGame) sessionFactory.getCurrentSession().load(EventGame.class, id);
		if (null != eventgames) {
			sessionFactory.getCurrentSession().delete(eventgames);
		}
	}

}
