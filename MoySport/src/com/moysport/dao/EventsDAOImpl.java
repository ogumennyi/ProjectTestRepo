package com.moysport.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.Events;

import org.hibernate.Query;
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
	public List<Events> viewEvent(int idevent) {
		String sql = "from Events where idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		return sessionFactory.getCurrentSession().createQuery("select e.name, l.name as location, s.name as sport, e.idevent from Events e, Sport s, Locations l where e.idsport=s.idsport and e.idlocation=l.idlocation").list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Events> searchEvents(ArrayList<String> params) {
		String sql = "select e.name, l.name as location, s.name as sport, e.idevent from Events e, Sport s, Locations l where e.idsport=s.idsport and e.idlocation=l.idlocation";
		Iterator<String> i = params.iterator();
		while(i.hasNext()){
			sql+=" and "+i.next();
		}
		return sessionFactory.getCurrentSession().createQuery(sql).list();
	}

	public void removeEvents(Integer id) {
		Events event = (Events) sessionFactory.getCurrentSession().load(Events.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

}

