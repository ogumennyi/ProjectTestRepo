package com.moysport.dao;

import java.util.List;

import com.moysport.model.Events;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventsDAOImpl implements EventsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEvents(Events event) {
		sessionFactory.getCurrentSession().save(event);
	}

	@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		return sessionFactory.getCurrentSession().createQuery("select e.name, l.name as location, s.name as sport from Events e, Sport s, Locations l where e.idsport=s.idsport and e.idlocation=l.idlocation").list();
	}

	public void removeEvents(Integer id) {
		Events event = (Events) sessionFactory.getCurrentSession().load(Events.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

}

