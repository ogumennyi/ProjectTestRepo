package com.moysport.dao;

import java.util.List;

import com.moysport.model.Locations;

public interface LocationsDAO {

	public void addLocations(Locations locations);
	
	public List<Locations> listLocations();
	
	public void removeLocations(Integer id);
	
}
