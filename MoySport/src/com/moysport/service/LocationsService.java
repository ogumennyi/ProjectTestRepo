package com.moysport.service;

import java.util.List;

import com.moysport.model.Locations;

public interface LocationsService {

	public void addLocations(Locations locations);

	public List<Locations> listLocations();

	public void removeLocations(Integer id);

}