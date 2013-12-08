package com.moysport.service;

import java.util.List;

import com.moysport.model.Location;

public interface LocationService {

	public void addLocations(Location location);

	public List<Location> listLocations();

	public void removeLocations(Integer id);

}