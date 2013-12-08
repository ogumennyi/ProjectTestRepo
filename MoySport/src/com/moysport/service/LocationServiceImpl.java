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
	private LocationDAO LocationDAO;

	@Transactional
	public void addLocations(Location location) {
		LocationDAO.addLocations(location);
	}

	@Transactional
	public List<Location> listLocations() {
		return LocationDAO.listLocations();
	}

	@Transactional
	public void removeLocations(Integer id) {
		LocationDAO.removeLocations(id);
	}

}