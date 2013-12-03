package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Locations;
import com.moysport.service.LocationsService;

@Controller
public class LocationsController {
	
	@Autowired
	private LocationsService locationsService;

	@RequestMapping("/table_pages/locations")
	public String listLocations(Map<String, Object> map) {
		map.put("locations", new Locations());
		map.put("locationsList", locationsService.listLocations());
		return "table_pages/locations";
	}

	@RequestMapping(value = "/table_pages/locations/add", method = RequestMethod.POST)
	public String addLocations(@ModelAttribute("locations") Locations locations, BindingResult result) {
		locationsService.addLocations(locations);
		return "redirect:/table_pages/locations";
	}

	@RequestMapping(value = "/table_pages/locations/delete", method = RequestMethod.POST)
	public String deleteLocations(@RequestParam("idlocation") Integer idlocation) {
		locationsService.removeLocations(idlocation);
		return "redirect:/table_pages/locations";
	}

}
