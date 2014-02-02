package com.moysport.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		// Retrieve existing location via id
		Location existingLocation = (Location) sessionFactory.getCurrentSession().get(Location.class, location.getIdlocation());
		// Assign updated values to this location
		existingLocation.setName(location.getName());
		existingLocation.setCountry(location.getCountry());
		existingLocation.setRegion(location.getRegion());
		existingLocation.setCity(location.getCity());
		existingLocation.setDistrict(location.getDistrict());
		existingLocation.setStreet(location.getStreet());
		existingLocation.setBuilding(location.getBuilding());
		existingLocation.setZip(location.getZip());
		existingLocation.setDescription(location.getDescription());
		existingLocation.setContacts(location.getContacts());
		existingLocation.setHttplink(location.getHttplink());
		existingLocation.setStatus(location.getStatus());
		
		existingLocation.setChangedate(location.getChangedate());
		existingLocation.setIdchangeby(location.getIdchangeby());
		
		// Save updates
		sessionFactory.getCurrentSession().save(existingLocation);
	}

}
