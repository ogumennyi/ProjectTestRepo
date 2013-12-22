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
		return sessionFactory.getCurrentSession().createQuery("from EventGame").list();
	}

	public EventGame viewEventgame(int idgame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from EventGame where idgame=:idgame");
		query.setParameter("idgame", idgame);
		EventGame eventgames = (EventGame) query.list().get(0);
		Hibernate.initialize(eventgames.getGameparties());
		return eventgames;
	}

	public void removeEventgames(Integer id) {
		EventGame eventgames = (EventGame) sessionFactory.getCurrentSession().load(EventGame.class, id);
		if (null != eventgames) {
			sessionFactory.getCurrentSession().delete(eventgames);
		}
	}

	@SuppressWarnings("unchecked")
	public List<EventGame> getAll(Integer idEvent) {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM EventGame WHERE events.idevent=" + idEvent);
		return query.list();
	}

	/**
	 * Retrieves all games
	 */

	@SuppressWarnings("unchecked")
	public List<EventGame> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM EventGame");
		return query.list();
	}

	/**
	 * Retrieves a single game
	 */
	@SuppressWarnings("unchecked")
	public EventGame get(int idGame) {
		Query query = sessionFactory.getCurrentSession().createQuery("from EventGame where idgame=:idgame");
		query.setParameter("idgame", idGame);
		List<EventGame> eventgamelist = query.list();
		return eventgamelist.size() > 0 ? (EventGame) eventgamelist.get(0) : null;

	}

	public void add(EventGame eventGame) {
		sessionFactory.getCurrentSession().save(eventGame);
	}

	public void delete(Integer id) {
		EventGame eventGame = (EventGame) sessionFactory.getCurrentSession().get(EventGame.class, id);
		sessionFactory.getCurrentSession().delete(eventGame);
	}

	/**
	 * Deletes all games based on the events id
	 */
	public void deleteAll(Integer idevent) {
		Query query = sessionFactory.getCurrentSession().createQuery("DELETE FROM EventGame WHERE event.idevent=" + idevent);
		query.executeUpdate();
	}

	/**
	 * Edits an existing game
	 */

	public void update(EventGame eventGame) {
		// Retrieve existing credit card via id
		EventGame existingEventGame = (EventGame) sessionFactory.getCurrentSession().get(EventGame.class, eventGame.getIdgame());
		// Assign updated values to this eventGame
		if (eventGame.getComments() != null)
			existingEventGame.setComments(eventGame.getComments());
		if (eventGame.getEndtime() != null)
			existingEventGame.setEndtime(eventGame.getEndtime());
		if (eventGame.getStarttime() != null)
			existingEventGame.setStarttime(eventGame.getStarttime());
		// Save updates
		sessionFactory.getCurrentSession().save(existingEventGame);
	}

}
