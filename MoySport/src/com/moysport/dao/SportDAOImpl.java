package com.moysport.dao;

import java.util.List;

import com.moysport.model.Sport;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SportDAOImpl implements SportDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addSport(Sport sport) {
		sessionFactory.getCurrentSession().save(sport);
	}

	@SuppressWarnings("unchecked")
	public List<Sport> listSport() {
		return sessionFactory.getCurrentSession().createQuery("from Sport").list();
	}

	public void removeSport(Integer id) {
		Sport sport = (Sport) sessionFactory.getCurrentSession().load(Sport.class, id);
		if (null != sport) {
			sessionFactory.getCurrentSession().delete(sport);
		}
	}
	// Added by Medynskyy. Search for Sport via sportId key 
	@SuppressWarnings("unchecked")
	public Sport getSportId(int idsport) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Sport where idsport=:idsport");
		query.setParameter("idsport",idsport);
		List<Sport> sportlist = query.list();
		return sportlist.size() > 0 ? (Sport) sportlist.get(0) : null;
	}
	


}
