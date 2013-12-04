package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Events;

@Repository
public class EventsDAOImpl implements EventsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEvents(Events Events) {
		sessionFactory.getCurrentSession().save(Events);
	}

	@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		return sessionFactory.getCurrentSession().createQuery("from Events").list();
	}

	public void removeEvents(Integer id) {
		Events Events = (Events) sessionFactory.getCurrentSession().load(Events.class, id);
		if (null != Events) {
			sessionFactory.getCurrentSession().delete(Events);
		}
	}

}