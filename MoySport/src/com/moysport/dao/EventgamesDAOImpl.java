package com.moysport.dao;

import java.util.List;

import com.moysport.model.Game;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventgamesDAOImpl implements EventgamesDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEventgames(Game game) {
		sessionFactory.getCurrentSession().save(game);
	}

	@SuppressWarnings("unchecked")
	public List<Game> listEventgames() {
		return sessionFactory.getCurrentSession().createQuery("from Game").list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Game> viewEventgame(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Game where idgame=:idgame");
		query.setParameter("idgame",idgame);
		return query.list();
	}

	public void removeEventgames(Integer id) {
		Game game = (Game) sessionFactory.getCurrentSession().load(Game.class, id);
		if (null != game) {
			sessionFactory.getCurrentSession().delete(game);
		}
	}

}
