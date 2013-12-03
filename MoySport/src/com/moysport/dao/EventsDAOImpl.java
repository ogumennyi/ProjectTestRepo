package com.moysport.dao;

import java.util.ArrayList;
import java.util.Iterator;
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

	//@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		List<Events> l = new ArrayList<Events>();
		List<Object> lo = sessionFactory.getCurrentSession().createQuery("select e.name, e.idlocation, s.rules from Events e, Sport s where e.idsport=s.idsport").list();
		Iterator<Object> i = lo.iterator();
		while(i.hasNext()){
			System.out.println(i.next());
			l.add((Events) i.next());
		}
		return l;
	}

	public void removeEvents(Integer id) {
		Events event = (Events) sessionFactory.getCurrentSession().load(Events.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

}
