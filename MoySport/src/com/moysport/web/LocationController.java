package com.moysport.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Location;
import com.moysport.model.User;
import com.moysport.service.LocationService;
import com.moysport.service.SportService;

@Controller
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	@Autowired
	SportService sportService;
	
	@RequestMapping(value = "/pages/locations/searchlocations", method = RequestMethod.GET)
	public String searchlocations(Map<String, Object> map) {
		map.put("locationsList", locationService.listLocations());
		map.put("sportList", sportService.listSport());
		return "pages/locations/searchlocations";
	}
	
	@RequestMapping(value = "/locations/search", method = RequestMethod.POST)
	public String searchlocations(@RequestParam("idsport") String idsport, @RequestParam("keyword") String keyword,
			Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		HashMap<String, String> params = new HashMap<String, String>();
		/*if (idsport != null && idsport.length() > 0)
			params.put("idsport", "sport.idsport='" + idsport + "'");*/
		if (keyword != null && keyword.length() > 0)
			params.put("keyword", "name like '%" + keyword + "%'");
		map.put("locationsList", locationService.searchLocations(params));
		map.put("idsport", idsport);
		//map.put("location", location);
		map.put("keyword", keyword);
		return "pages/locations/searchlocations";
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
		location.setCheckin(0);
		//location.setIdchangeby(user.getIduser());
		location.setChangeby(user);
		location.setChangedate(sysdate);
		location.setCreatedby(user);
		//location.setIdcreatedby(user.getIduser());
		location.setCreationdate(sysdate);
		locationService.addLocations(location);
		
		return "redirect:/pages/locations/searchlocations";
	}
	
	@RequestMapping(value = "/pages/locations/viewlocation/{idlocation}", method = RequestMethod.GET)
	public String viewEvent(@PathVariable int idlocation, Map<String, Object> map) {
		map.put("location", locationService.get(idlocation));
		return "pages/locations/viewlocation";
	}
	
	
	/* Edit event, GET method , user fills out the form */
	@RequestMapping(value = "/pages/locations/editlocation/{idlocation}", method = RequestMethod.GET)
	public String eventEdit(@PathVariable int idlocation, Map<String, Object> map) {
		Location existingLocation =  locationService.get(idlocation);
		// Add to model
		map.put("location", existingLocation);
		/*map.put("idlocation", existingEvent.getLocations().getIdlocation());
		map.put("idsport", existingEvent.getSport().getIdsport());
		map.put("sportList", sportService.listSport());
		map.put("locationList", locationService.listLocations());
		map.put("eventgames", eventGameService.getAll(idevent));*/

		return "pages/locations/editlocation";
	}

	/* Edit event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/locations/editlocation", method = RequestMethod.POST)
	public String eventEdit(@ModelAttribute("location") Location location,
			BindingResult result, Map<String, Object> map) {
		Timestamp sysdate = new Timestamp(new Date().getTime());
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//location.setIdchangeby(user.getIduser());
		location.setChangeby(user);
		location.setChangedate(sysdate);
		locationService.updateLocation(location);
		
		return "redirect:/pages/locations/searchlocations";
	}
	
	
	
	
	
	
	
	/*@RequestMapping(value = "/pages/locations/addlocation", method = RequestMethod.POST)
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
	}*/

}
