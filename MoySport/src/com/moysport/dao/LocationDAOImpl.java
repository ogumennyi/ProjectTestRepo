package com.moysport.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Location;
import com.moysport.model.Sport;

@Repository
public class LocationDAOImpl implements LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addLocations(Location location) {
		sessionFactory.getCurrentSession().save(location);
	}

	@SuppressWarnings("unchecked")
	public List<Location> listLocations() {
		return sessionFactory.getCurrentSession().createQuery("from Location").list();
	}

	public void removeLocations(Integer id) {
		Location location = (Location) sessionFactory.getCurrentSession().load(Location.class, id);
		if (null != location) {
			sessionFactory.getCurrentSession().delete(location);
		}
	}
	// Added by Medynskyy. Search for Location via idlocation key 
	@SuppressWarnings("unchecked")
	public Location getLocationId(int idlocation) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Location where idlocation=:idlocation");
		query.setParameter("idlocation",idlocation);
		List<Location> locationlist = query.list();
		return locationlist.size() > 0 ? (Location) locationlist.get(0) : null;
	}
	

}