package com.moysport.dao;

import java.util.List;

import com.moysport.model.EventGame;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GameDAOImpl implements GameDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addGame(EventGame eventGame) {
		sessionFactory.getCurrentSession().save(eventGame);
	}

	@SuppressWarnings("unchecked")
	public List<EventGame> listEventgames() {
		return sessionFactory.getCurrentSession().createQuery("from EventGame").list();
	}
	
	@SuppressWarnings("unchecked")
	public List<EventGame> viewEventgame(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from EventGame where idgame=:idgame");
		query.setParameter("idgame",idgame);
		return query.list();
	}

	public void removeEventgames(Integer id) {
		EventGame eventGame = (EventGame) sessionFactory.getCurrentSession().load(EventGame.class, id);
		if (null != eventGame) {
			sessionFactory.getCurrentSession().delete(eventGame);
		}
	}

}
