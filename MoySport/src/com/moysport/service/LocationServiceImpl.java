package com.moysport.service;

import java.util.List;

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
	public void addLocations(Location locations) {
		locationDAO.addLocations(locations);
	}

	@Transactional
	public List<Location> listLocations() {
		return locationDAO.listLocations();
	}

	@Transactional
	public void removeLocations(Integer id) {
		locationDAO.removeLocations(id);
	}
	
	@Transactional
	public Location get( int idlocation ){
		return locationDAO.getLocationId(idlocation);
	}

}
