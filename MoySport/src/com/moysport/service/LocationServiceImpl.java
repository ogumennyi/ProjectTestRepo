package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.LocationDAO;
import com.moysport.model.Location;

@Service
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	private LocationDAO locationDAO;

	@Transactional
	public List<Location> listLocations() {
		//return locationDAO.listLocations();
		List<Location> locationsList = locationDAO.listLocations();
		for (Location location : locationsList) {
			Hibernate.initialize(location.getLocationsports());
		}
		return locationsList;
	}
	
	@Transactional
	public List<Location> searchLocations() {
		List<Location> locationsList = locationDAO.listLocations();
		for (Location location : locationsList) {
			Hibernate.initialize(location.getLocationsports());
		}
		return locationsList;
	}
	
	@Transactional
	public List<Location> searchLocations(HashMap<String, String> params) {
		List<Location> locationsList = locationDAO.listLocations(params);
		for (Location location : locationsList) {
			Hibernate.initialize(location.getLocationsports());
		}
		return locationsList;
	}
	
	@Transactional
	public void addLocations(Location locations) {
		locationDAO.addLocations(locations);
	}


	@Transactional
	public void removeLocations(Integer id) {
		locationDAO.removeLocations(id);
	}
	
	@Transactional
	public Location get( int idlocation ){
		Location location = locationDAO.getLocationId(idlocation);
		Hibernate.initialize(location.getLocationsports());
		return location;
	}
	
	@Transactional
	public void updateLocation(Location location) {
		locationDAO.updateLocation(location);
	}

}
