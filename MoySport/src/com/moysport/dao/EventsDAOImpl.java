package com.moysport.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.Eventgames;
import com.moysport.model.Events;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventsDAOImpl implements EventsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addEvents(Events event) {
		sessionFactory.getCurrentSession().save(event);
	}

	public Events viewEvent(int idevent) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Events.class);
		cr.add(Restrictions.idEq(idevent));
		Events event = (Events)cr.uniqueResult();
		Hibernate.initialize(event.getEventgames());
		for(Eventgames eventgames : event.getEventgames()){
			Hibernate.initialize(eventgames.getGameparties());
		}
		return event;
	}
	
	@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		String sql = "from Events e order by e.idevent";
		List<Events> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for(Events event : eventsList){
			Hibernate.initialize(event.getEventgames());
			for(Eventgames eventgames : event.getEventgames()){
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Events> searchEvents(HashMap<String, String> params) {
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
		List<Events> eventsList = sessionFactory.getCurrentSession().createQuery(sql).list();
		for(Events event : eventsList){
			Hibernate.initialize(event.getEventgames());
			for(Eventgames eventgames : event.getEventgames()){
				eventgames.setGamePartiesCount(eventgames.getGameparties().size());
			}
		}
		return eventsList;
	}

	public void removeEvents(Integer id) {
		Events event = (Events) sessionFactory.getCurrentSession().load(Events.class, id);
		if (null != event) {
			sessionFactory.getCurrentSession().delete(event);
		}
	}

}

