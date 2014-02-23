package com.moysport.dao;

import java.util.List;

import com.moysport.model.LocationSport;

public interface LocationSportDAO {

	public void addLocationSport(LocationSport sport);
	public List<LocationSport> listLocationSport();
	public void removeLocationSport(Integer id);
}
