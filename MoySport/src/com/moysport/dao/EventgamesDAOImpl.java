package com.moysport.dao;

import java.util.List;

import com.moysport.model.Eventgames;

import org.hibernate.Query;
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
	
	@SuppressWarnings("unchecked")
	public List<Eventgames> viewEventgame(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Eventgames where idgame=:idgame");
		query.setParameter("idgame",idgame);
		return query.list();
	}

	public void removeEventgames(Integer id) {
		Eventgames eventgames = (Eventgames) sessionFactory.getCurrentSession().load(Eventgames.class, id);
		if (null != eventgames) {
			sessionFactory.getCurrentSession().delete(eventgames);
		}
	}

}
