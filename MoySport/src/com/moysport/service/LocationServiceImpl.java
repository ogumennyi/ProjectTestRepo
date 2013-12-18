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
	private LocationDAO LocationsDAO;

	@Transactional
	public void addLocations(Location locations) {
		LocationsDAO.addLocations(locations);
	}

	@Transactional
	public List<Location> listLocations() {
		return LocationsDAO.listLocations();
	}

	@Transactional
	public void removeLocations(Integer id) {
		LocationsDAO.removeLocations(id);
	}

}