package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Locations;

@Repository
public class LocationsDAOImpl implements LocationsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addLocations(Locations locations) {
		sessionFactory.getCurrentSession().save(locations);
	}

	@SuppressWarnings("unchecked")
	public List<Locations> listLocations() {
		return sessionFactory.getCurrentSession().createQuery("from Locations").list();
	}

	public void removeLocations(Integer id) {
		Locations locations = (Locations) sessionFactory.getCurrentSession().load(Locations.class, id);
		if (null != locations) {
			sessionFactory.getCurrentSession().delete(locations);
		}
	}

}