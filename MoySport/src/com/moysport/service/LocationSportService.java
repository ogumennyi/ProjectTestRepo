package com.moysport.service;

import java.util.List;

import com.moysport.model.LocationSport;

public interface LocationSportService {

	public void addLocationSport(LocationSport locationsport);

	public List<LocationSport> listLocationSport();

	public void removeLocationSport(Integer id);

}
