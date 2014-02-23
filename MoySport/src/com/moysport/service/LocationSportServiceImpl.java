package com.moysport.service;

import java.util.List;

import com.moysport.dao.LocationSportDAO;
import com.moysport.model.LocationSport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LocationSportServiceImpl implements LocationSportService {
	
	@Autowired
	private LocationSportDAO LocationSportDAO;

	@Transactional
	public void addLocationSport(LocationSport locationsport) {
		LocationSportDAO.addLocationSport(locationsport);
	}

	@Transactional
	public List<LocationSport> listLocationSport() {
		return LocationSportDAO.listLocationSport();
	}

	@Transactional
	public void removeLocationSport(Integer id) {
		LocationSportDAO.removeLocationSport(id);
	}
}
