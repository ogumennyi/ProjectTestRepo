package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.GameRating;

@Repository
public class GameRatingDAOImpl implements GameRatingDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addGameratings(GameRating Gameratings) {
		sessionFactory.getCurrentSession().save(Gameratings);
	}

	@SuppressWarnings("unchecked")
	public List<GameRating> listGameratings() {
		return sessionFactory.getCurrentSession().createQuery("from GameRating").list();
	}

	public void removeGameratings(Integer id) {
		GameRating Gameratings = (GameRating) sessionFactory.getCurrentSession().load(GameRating.class, id);
		if (null != Gameratings) {
			sessionFactory.getCurrentSession().delete(Gameratings);
		}
	}

}