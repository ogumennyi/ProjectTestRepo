package com.moysport.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.Event;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	public List<Event> listEvents() {
		return sessionFactory.getCurrentSession().createQuery("FROM Event").list();
	}	
	
	@SuppressWarnings("unchecked")
	public List<Event> listEvents(HashMap<String, String> params) {
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
		return sessionFactory.getCurrentSession().createQuery(sql).list();
	}
	
	public Event getEvent(int idevent) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Event.class);
		cr.add(Restrictions.idEq(idevent));
		Event event = (Event) cr.uniqueResult();
		return event;
	}	
	
	public void addEvent(Event event) {
		sessionFactory.getCurrentSession().save(event);
	}

	public void updateEvent(Event event) {
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
	
	public void deleteEvent(Integer id) {
		Event event = (Event) sessionFactory.getCurrentSession().get(Event.class, id);
		sessionFactory.getCurrentSession().delete(event);
	}

}
