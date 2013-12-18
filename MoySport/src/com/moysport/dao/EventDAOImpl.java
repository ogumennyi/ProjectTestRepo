package com.moysport.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.EventGame;
import com.moysport.model.Event;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEvents(Event event) {
		sessionFactory.getCurrentSession().save(event);
	}

	public Event viewEvent(int idevent) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Event.class);
		cr.add(Restrictions.idEq(idevent));
		Event event = (Event) cr.uniqueResult();
		Hibernate.initialize(event.getEventgames());
		for (EventGame eventgames : event.getEventgames()) {
			Hibernate.initialize(eventgames.getGameparties());
		}
		return event;
	}
	
	@SuppressWarnings("unchecked")
    public List<EventGame> eventGame(int idevent) {
            String sql = "from EventGame where idevent=:idevent";
            Query query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setParameter("idevent",idevent);
            return query.list();
    }

	@SuppressWarnings("unchecked")
	public List<Event> listEvents() {
		String sql = "from Event e order by e.idevent";
		List<Event> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for (Event event : eventsList) {
			Hibernate.initialize(event.getEventgames());
			for (EventGame eventgames : event.getEventgames()) {
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}

	@SuppressWarnings("unchecked")
	public List<Event> searchEvents(HashMap<String, String> params) {
		String sql = "from Event";
		Iterator<String> i = params.keySet().iterator();
		boolean isFirst = true;
		while (i.hasNext()) {
			String key = i.next();
			if (isFirst) {
				sql += " where " + params.get(key);
				isFirst = false;
			} else {
				sql += " and " + params.get(key);
			}
		}
		List<Event> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for (Event event : eventsList) {
			Hibernate.initialize(event.getEventgames());
			for (EventGame eventgames : event.getEventgames()) {
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}

	public void removeEvents(Integer id) {
		Event event = (Event) sessionFactory.getCurrentSession().load(Event.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Event> getAll() {
		Query query = sessionFactory.getCurrentSession().createQuery("FROM Event");
		return query.list();
	}

	/**
	 * Adds a new evet
	 */
	public void add(Event event) {
		// Persists to db
		sessionFactory.getCurrentSession().save(event);
	}

	/**
	 * Deletes an existing event
	 * 
	 * @param id
	 *            the id of the existing event
	 */
	public void delete(Integer id) {
		// Retrieve existing person
		Event event = (Event) sessionFactory.getCurrentSession().get(Event.class, id);
		// Delete
		sessionFactory.getCurrentSession().delete(event);
	}

	/**
	 * Edits an existing event
	 */
	public void update(Event event) {
		// Retrieve existing event via id
		Event existingEvent = (Event) sessionFactory.getCurrentSession().get(Event.class, event.getIdevent());
		// Assign updated values to this event
		if (event.getChangedate() != null)
			existingEvent.setChangedate(event.getChangedate());
		if (event.getLocations() != null)
			existingEvent.setLocations(event.getLocations());
		if (event.getMark() != null)
			existingEvent.setMark(event.getMark());
		if (event.getName() != null)
			existingEvent.setName(event.getName());
		if (event.getSport() != null)
			existingEvent.setSport(event.getSport());
		if (event.getMarkcnt() != null)
			existingEvent.setMarkcnt(event.getMarkcnt());
		// Save updates
		sessionFactory.getCurrentSession().save(existingEvent);
	}

	@SuppressWarnings("unchecked")
	public Event get(int idevent) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Event where idevent=:idevent");
		query.setParameter("idevent", idevent);
		List<Event> eventlist = query.list();
		return eventlist.size() > 0 ? (Event) eventlist.get(0) : null;
	}

}
