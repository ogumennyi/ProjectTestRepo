package com.moysport.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.EventGame;
import com.moysport.model.Event;
import com.moysport.model.Gameparties;
import com.moysport.model.Location;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Event> getAll() {
		   
	     // Retrieve all events
	 Query query = sessionFactory.getCurrentSession().createQuery("FROM Event");
		   
	 // Retrieve all
	  return  query.list();
	 }

	@SuppressWarnings("unchecked")
	public Event get( Integer id ) {
	     // Retrieve existing event
	  Event event = (Event) sessionFactory.getCurrentSession().get(Event.class, id);
	  return event;
	 }
		  
	/**
	 * Adds a new evet
	 */
	@SuppressWarnings("unchecked")
	public void add(Event event) {
			 
		  // Persists to db
	  sessionFactory.getCurrentSession().save(event);
	}
		  
	 /**
	  * Deletes an existing event
	  * @param id the id of the existing event
	  */
	@SuppressWarnings("unchecked")
	public void delete(Integer id) {
		   
		// Retrieve existing person
		 Event event = (Event) sessionFactory.getCurrentSession().get(Event.class, id);
		   
		 // Delete 
		 sessionFactory.getCurrentSession().delete(event);
	 }
		  
	 /**
	 * Edits an existing event
	 */
	@SuppressWarnings("unchecked")
	public void update(Event event) {
		   
	// Retrieve existing event via id
	  Event existingEvent = (Event) sessionFactory.getCurrentSession().get(Event.class, event.getIdevent());
	   
	  // Assign updated values to this event
	  
	  if(event.getChangedate()!=null) existingEvent.setChangedate(event.getChangedate());
	  if(event.getLocations()!=null) existingEvent.setLocations(event.getLocations());
	  if(event.getMark()!=null) existingEvent.setMark(event.getMark());
	  if(event.getName()!=null) existingEvent.setName(event.getName());
	  if(event.getSport()!=null) existingEvent.setSport(event.getSport());
	  if(event.getMarkcnt()!=null) existingEvent.setMarkcnt(event.getMarkcnt());
	  
	  // Save updates
	  sessionFactory.getCurrentSession().save(existingEvent);
	}
		 
		 

	@SuppressWarnings("unchecked")
	public List<Event> viewEvent(int idevent) {
		String sql = 
			"select e.name, u.lastname, u.firstname, l.name as location " + 
			"from Event e, User u, Location l " + 
			"where e.idcreatedby=u.iduser and e.location=l.idlocation and e.idevent=:idevent";
	//	"select e.name, u.lastname, u.firstname, l.name as location " + 
	//	"from Event e, User u, Location l " + 
	//	"where e.idcreatedby=u.iduser and e.idlocation=l.idlocation and e.idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
/*	@SuppressWarnings("unchecked")
	public List<Event> viewEvent(int idevent) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Event where idevent=:idevent");
		query.setParameter("idevent",idevent);
		return query.list();
	}
*/
	@SuppressWarnings("unchecked")
	public List<EventGame> eventGame(int idevent) {
		String sql = "from EventGame where idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Gameparties> gameparties(int idevent) {
		String sql = 
			"select u.lastname, u.firstname, u.iduser " + 
			"from EventGame e, Gameparties g, User u " + 
			"where e.idgame=g.idgame and g.iduser=u.iduser and e.idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> listEvents() {
		//String sql = "select e from Event e order by e.idevent";
		String sql = "FROM Event";

			/*"select e.name, l.name as location, s.name as sport, e.idevent, eg.starttime, eg.endtime, eg.idgame " + 
			"from Event e, Sport s, Location l, EventGame eg " + 
			"where e.idsport=s.idsport and e.idlocation=l.idlocation and e.idevent=eg.idevent " + 
			"order by e.idevent";*/
		return sessionFactory.getCurrentSession().createQuery(sql).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> searchEvents(ArrayList<String> params) {
		String sql = "select e.name, l.name as location, s.name as sport, e.idevent from Event e, Sport s, Location l where e.idsport=s.idsport and e.idlocation=l.idlocation";
		Iterator<String> i = params.iterator();
		while(i.hasNext()){
			sql+=" and "+i.next();
		}
		return sessionFactory.getCurrentSession().createQuery(sql).list();
	}

	@SuppressWarnings("unchecked")
	public void removeEvents(Integer id) {
		Event event = (Event) sessionFactory.getCurrentSession().load(Event.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

	// Added by Medynskyy. Search for Event via idevent key 
	@SuppressWarnings("unchecked")
	public Event getEventId(int idevent) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Event where idevent=:idevent");
		query.setParameter("idevent",idevent);
		List<Event> eventlist = query.list();
		return eventlist.size() > 0 ? (Event) eventlist.get(0) : null;
	}


	
}

