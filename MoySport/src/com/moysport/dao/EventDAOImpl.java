package com.moysport.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.EventGame;
import com.moysport.model.Event;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
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
		Event event = (Event)cr.uniqueResult();
		Hibernate.initialize(event.getEventgames());
		for(EventGame eventgames : event.getEventgames()){
			Hibernate.initialize(eventgames.getGameparties());
		}
		return event;
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> listEvents() {
		String sql = "from Events e order by e.idevent";
		List<Event> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for(Event event : eventsList){
			Hibernate.initialize(event.getEventgames());
			for(EventGame eventgames : event.getEventgames()){
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Event> searchEvents(HashMap<String, String> params) {
		String sql = "from Events";
		Iterator<String> i = params.keySet().iterator();
		boolean isFirst = true;
		while(i.hasNext()){
			String key = i.next();
			if(isFirst){
				sql+=" where "+params.get(key);
				isFirst = false;
			} else {
				sql+=" and "+params.get(key);
			}
		}
		List<Event> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for(Event event : eventsList){
			Hibernate.initialize(event.getEventgames());
			for(EventGame eventgames : event.getEventgames()){
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

}

