package com.moysport.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.moysport.model.Eventgames;
import com.moysport.model.Events;
import com.moysport.model.Gameparties;

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
		String sql = 
			"select e.name, u.lastname, u.firstname, l.name as location " + 
			"from Events e, User u, Locations l " + 
			"where e.idcreatedby=u.iduser and e.idlocation=l.idlocation and e.idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Eventgames> eventgames(int idevent) {
		String sql = "from Eventgames where idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Gameparties> gameparties(int idevent) {
		String sql = 
			"select u.lastname, u.firstname, u.iduser " + 
			"from Eventgames e, Gameparties g, User u " + 
			"where e.idgame=g.idgame and g.iduser=u.iduser and e.idevent=:idevent";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setParameter("idevent",idevent);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Events> listEvents() {
		String sql =
			"select e from Events e order by e.idevent";
			/*"select e.name, l.name as location, s.name as sport, e.idevent, eg.starttime, eg.endtime, eg.idgame " + 
			"from Events e, Sport s, Locations l, Eventgames eg " + 
			"where e.idsport=s.idsport and e.idlocation=l.idlocation and e.idevent=eg.idevent " + 
			"order by e.idevent";*/
		return sessionFactory.getCurrentSession().createQuery(sql).list();
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

