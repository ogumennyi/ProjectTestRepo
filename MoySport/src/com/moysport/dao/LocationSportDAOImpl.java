package com.moysport.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.LocationSport;

@Repository
public class LocationSportDAOImpl implements LocationSportDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addLocationSport(LocationSport locationsport) {
		sessionFactory.getCurrentSession().save(locationsport);
	}

	@SuppressWarnings("unchecked")
	public List<LocationSport> listLocationSport() {
		return sessionFactory.getCurrentSession().createQuery("from LocationSport").list();
	}

	public void removeLocationSport(Integer id) {
		LocationSport locationsport = (LocationSport) sessionFactory.getCurrentSession().load(LocationSport.class, id);
		if (null != locationsport) {
			sessionFactory.getCurrentSession().delete(locationsport);
		}
	}

}