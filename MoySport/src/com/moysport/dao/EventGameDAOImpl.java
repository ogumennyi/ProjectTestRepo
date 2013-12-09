package com.moysport.dao;

import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.EventGame;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventGameDAOImpl implements EventGameDAO {

	@Autowired
	private SessionFactory sessionFactory;
	/**
	  * Retrieves all games for specific event
	  */
	 public List<EventGame> getAll(Integer id) {
	
	  Query query = sessionFactory.getCurrentSession().createQuery("FROM EventGame WHERE event.idevent=" + id);

	  // Retrieve all
	  return  query.list();
	 }
	 
	/**
	  * Retrieves all games
	  */
	 
	 public List<EventGame> getAll() {

	  Query query = sessionFactory.getCurrentSession().createQuery("FROM EventGame");
		   
	  // Retrieve all
	  return  query.list();
	 }
		  
	 /**
	  * Retrieves a single game
	  */
	 public EventGame get( int idgame ) {
		   
		  // Retrieve existing eventGame
			Query query = sessionFactory.getCurrentSession().createQuery("from EventGame where idgame=:idgame");
			query.setParameter("idgame",idgame);
			List<EventGame> eventgamelist = query.list();
			return eventgamelist.size() > 0 ? (EventGame) eventgamelist.get(0) : null;

	}
		  
	 /**
	  * Adds a new game
	  */
	 
	 public void add(EventGame eventGame) {
		   
		 sessionFactory.getCurrentSession().save(eventGame);
	}
		  
	 
	/**
	 * Deletes an existing game
	 */
	 public void delete(Integer id) {
		   
	  // Retrieve existing credit card
		 EventGame eventGame = (EventGame) sessionFactory.getCurrentSession().get(EventGame.class, id);
		   
		  // Delete 
		 sessionFactory.getCurrentSession().delete(eventGame);
	 }
		  
	 /**
	 * Deletes all games based on the events id
	  */
	 public void deleteAll(Integer idevent) {

		   
	  Query query = sessionFactory.getCurrentSession().createQuery("DELETE FROM EventGame WHERE event.idevent=" +idevent);
		   
	  // Delete all
	  query.executeUpdate();
	 }
		  
	 /**
	  * Edits an existing game
	  */
	 
	 public void update(EventGame eventGame) {

		 // Retrieve existing credit card via id
		 EventGame existingEventGame = (EventGame) sessionFactory.getCurrentSession().get(EventGame.class, eventGame.getIdgame());
		   
		 // Assign updated values to this eventGame
		 if(eventGame.getComments()!=null) existingEventGame.setComments(eventGame.getComments());
		 if(eventGame.getEndtime()!=null) existingEventGame.setEndtime(eventGame.getEndtime());
		 if(eventGame.getStarttime()!=null) existingEventGame.setStarttime(eventGame.getStarttime());
		  // Save updates
		 sessionFactory.getCurrentSession().save(existingEventGame);
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






}
