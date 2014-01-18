package com.moysport.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Event;
import com.moysport.model.Location;
import com.moysport.model.User;
import com.moysport.service.LocationService;

@Controller
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value = "/pages/locations/searchlocations", method = RequestMethod.GET)
	public String searchlocations(Map<String, Object> map) {
		map.put("locationsList", locationService.listLocations());
		return "pages/locations/searchlocations";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/pages/locations/viewlocation", method = RequestMethod.GET)
	public String viewlocation(ModelMap model) {
		return "pages/locations/viewlocation";
	}
	
	@RequestMapping(value = "/pages/locations/createlocation", method = RequestMethod.GET)
	public String createlocation(Map<String, Object> map) {
		System.out.println(">>>In Post");
		map.put("location", new Location());
		return "pages/locations/createlocation";
	}
	
	/* Create event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/locations/createlocation", method = RequestMethod.POST)
	public String createlocation(@RequestParam("name") String name, @ModelAttribute("location") Location location,
			BindingResult result, Map<String, Object> map) {
		Timestamp sysdate = new Timestamp(new Date().getTime());
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		location.setIdchangeby(user.getIduser());
		location.setChangedate(sysdate);
		location.setIdcreatedby(user.getIduser());
		location.setCreationdate(sysdate);
		locationService.addLocations(location);
		/*
		java.util.Date date = new java.util.Date();
		long time = date.getTime();

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		event.setIdchangeby(user.getIduser());
		event.setCreatedby(user);
		event.setMark(0);
		event.setMarkcnt(0);
		event.setChangedate(new Timestamp(time));
		eventService.add(event, idlocation, idsport);*/
		return "redirect:/pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/locations/addlocation", method = RequestMethod.POST)
	public String addlocation(ModelMap model) {
		return "pages/locations/viewlocation";
	}
	
	
	
	
	
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
