package com.moysport.dao;

import java.util.List;

import com.moysport.model.Location;

public interface LocationDAO {

	public void addLocations(Location location);
	
	public List<Location> listLocations();
	
	public void removeLocations(Integer id);
	
}
