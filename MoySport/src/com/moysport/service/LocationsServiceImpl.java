package com.moysport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moysport.dao.LocationsDAO;
import com.moysport.model.Locations;

@Service
public class LocationsServiceImpl implements LocationsService {
	
	@Autowired
	private LocationsDAO LocationsDAO;

	@Transactional
	public void addLocations(Locations locations) {
		LocationsDAO.addLocations(locations);
	}

	@Transactional
	public List<Locations> listLocations() {
		return LocationsDAO.listLocations();
	}

	@Transactional
	public void removeLocations(Integer id) {
		LocationsDAO.removeLocations(id);
	}

}