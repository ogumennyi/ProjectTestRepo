package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Location;
import com.moysport.service.LocationService;

@Controller
public class LocationController {
	
	@Autowired
	private LocationService locationService;

	@RequestMapping("/table_pages/locations")
	public String listLocations(Map<String, Object> map) {
		map.put("locations", new Location());
		map.put("locationsList", locationService.listLocations());
		return "table_pages/locations";
	}

	@RequestMapping(value = "/table_pages/locations/add", method = RequestMethod.POST)
	public String addLocations(@ModelAttribute("locations") Location locations, BindingResult result) {
		locationService.addLocations(locations);
		return "redirect:/table_pages/locations";
	}

	@RequestMapping(value = "/table_pages/locations/delete", method = RequestMethod.POST)
	public String deleteLocations(@RequestParam("idlocation") Integer idlocation) {
		locationService.removeLocations(idlocation);
		return "redirect:/table_pages/locations";
	}

}
