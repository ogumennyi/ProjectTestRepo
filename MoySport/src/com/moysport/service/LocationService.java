package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Event;
import com.moysport.model.Location;

public interface LocationService {

	public List<Location> listLocations();
	public List<Location> searchLocations();
	
	public void addLocations(Location locations);
	public void removeLocations(Integer id);
	
	public Location get( int idlocation );

}
