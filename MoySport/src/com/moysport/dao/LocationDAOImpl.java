package com.moysport.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.moysport.model.Event;
import com.moysport.model.Location;

@Repository
public class LocationDAOImpl implements LocationDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addLocations(Location locations) {
		sessionFactory.getCurrentSession().save(locations);
	}

	@SuppressWarnings("unchecked")
	public List<Location> listLocations() {
		return sessionFactory.getCurrentSession().createQuery("from Location").list();
	}

	public void removeLocations(Integer id) {
		Location locations = (Location) sessionFactory.getCurrentSession().load(Location.class, id);
		if (null != locations) {
			sessionFactory.getCurrentSession().delete(locations);
		}
	}

	@SuppressWarnings("unchecked")
	public Location getLocationId(int idlocation) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Location where idlocation=:idlocation");
		query.setParameter("idlocation", idlocation);
		List<Location> locationlist = query.list();
		return locationlist.size() > 0 ? (Location) locationlist.get(0) : null;
	}
	
	public void updateLocation(Location location) {
		System.out.println(">>>>"+location.getIdlocation());
		System.out.println(">>>>"+location.getName());
		// Retrieve existing event via id
		Location existingLocation = (Location) sessionFactory.getCurrentSession().get(Location.class, location.getIdlocation());
		// Assign updated values to this event
		if (location.getName() != null)
			existingLocation.setName(location.getName());
		if (location.getCountry() != null)
			existingLocation.setCountry(location.getCountry());
		if (location.getRegion() != null)
			existingLocation.setRegion(location.getRegion());
		if (location.getCity() != null)
			existingLocation.setCity(location.getCity());
		if (location.getDistrict() != null)
			existingLocation.setDistrict(location.getDistrict());
		if (location.getStreet() != null)
			existingLocation.setStreet(location.getStreet());
		if (location.getBuilding() != null)
			existingLocation.setBuilding(location.getBuilding());
		if (location.getZip() != null)
			existingLocation.setZip(location.getZip());
		if (location.getDescription() != null)
			existingLocation.setDescription(location.getDescription());
		if (location.getContacts() != null)
			existingLocation.setContacts(location.getContacts());
		if (location.getHttplink() != null)
			existingLocation.setHttplink(location.getHttplink());
		if (location.getStatus() != null)
			existingLocation.setStatus(location.getStatus());
		
		/*if (event.getChangedate() != null)
			existingEvent.setChangedate(event.getChangedate());
		if (event.getLocations() != null)
			existingEvent.setLocations(event.getLocations());
		if (event.getMark() != null)
			existingEvent.setMark(event.getMark());
		if (event.getName() != null)
			existingEvent.setName(event.getName());
		if (event.getSport() != null)
			existingEvent.setSport(event.getSport());
		if (event.getMarkcnt() != null)
			existingEvent.setMarkcnt(event.getMarkcnt());*/
		// Save updates
		sessionFactory.getCurrentSession().save(existingLocation);
	}

}
