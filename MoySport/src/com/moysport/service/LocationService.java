package com.moysport.service;

import java.util.List;

import com.moysport.model.Location;

public interface LocationService {

	public void addLocations(Location locations);
	public List<Location> listLocations();
	public void removeLocations(Integer id);
	
	public Location get( int idlocation );

}
