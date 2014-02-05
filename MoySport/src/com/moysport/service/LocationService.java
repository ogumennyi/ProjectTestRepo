package com.moysport.service;

import java.util.HashMap;
import java.util.List;

import com.moysport.model.Location;

public interface LocationService {

	public List<Location> listLocations();
	public List<Location> searchLocations();
	public List<Location> searchLocations(HashMap<String, String> params);
	
	public void addLocations(Location locations);
	public void removeLocations(Integer id);
	
	public Location get( int idlocation );
	public void updateLocation(Location location);

}
