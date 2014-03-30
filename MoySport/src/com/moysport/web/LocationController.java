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
	public String searchlocations( @RequestParam("keyword") String keyword
									, @RequestParam("sp_city") String sp_city
									, @RequestParam("sp_district") String sp_district
									, @RequestParam("sp_street") String sp_street
									, @RequestParam("sp_building") String sp_building
									, @RequestParam("sp_contacts") String sp_contacts
									, @RequestParam("sp_httplink") String sp_httplink
									, @RequestParam("sp_description") String sp_description
									, Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		HashMap<String, String> params = new HashMap<String, String>();
		
		if (keyword != null && keyword.length() > 0)
			params.put("keyword", "name like '%" + keyword + "%'");
		if (sp_city != null && sp_city.length() > 0)
			params.put("sp_city", "city like '%" + sp_city + "%'");
		if (sp_district != null && sp_district.length() > 0)
			params.put("sp_district", "district like '%" + sp_district + "%'");
		if (sp_street != null && sp_street.length() > 0)
			params.put("sp_street", "street like '%" + sp_street + "%'");
		if (sp_building != null && sp_building.length() > 0)
			params.put("sp_building", "building like '%" + sp_building + "%'");
		if (sp_contacts != null && sp_contacts.length() > 0)
			params.put("sp_contacts", "contacts like '%" + sp_contacts + "%'");
		if (sp_httplink != null && sp_httplink.length() > 0)
			params.put("sp_httplink", "httplink like '%" + sp_httplink + "%'");
		if (sp_description != null && sp_description.length() > 0)
			params.put("sp_description", "description like '%" + sp_description + "%'");
		
		
		
		map.put("locationsList", locationService.searchLocations(params));
		map.put("keyword", keyword);
		map.put("sp_city", sp_city);
		map.put("sp_district", sp_district);
		map.put("sp_street", sp_street);
		map.put("sp_building", sp_building);
		map.put("sp_contacts", sp_contacts);
		map.put("sp_httplink", sp_httplink);
		map.put("sp_description", sp_description);
		return "pages/locations/searchlocations";
	}
	
	
	
	@RequestMapping(value = "/pages/locations/createlocation", method = RequestMethod.GET)
	public String createlocation(Map<String, Object> map) {
		map.put("location", new Location());
		map.put("sportList", sportService.listSport());
		return "pages/locations/createlocation";
	}
	
	/* Create event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/locations/createlocation", method = RequestMethod.POST)
	public String createlocation(@RequestParam("name") String name, @ModelAttribute("location") Location location,
			BindingResult result, Map<String, Object> map) {
		Timestamp sysdate = new Timestamp(new Date().getTime());
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		location.setCheckin(0);
		location.setChangeby(user);
		location.setChangedate(sysdate);
		location.setCreatedby(user);
		location.setCreationdate(sysdate);
		locationService.addLocations(location);
		
		return "redirect:/pages/locations/searchlocations";
	}
	
	@RequestMapping(value = "/pages/locations/viewlocation/{idlocation}", method = RequestMethod.GET)
	public String viewEvent(@PathVariable int idlocation, Map<String, Object> map) {
		Location location = locationService.get(idlocation);
		map.put("location", location);
		return "pages/locations/viewlocation";
	}
	
	
	/* Edit event, GET method , user fills out the form */
	@RequestMapping(value = "/pages/locations/editlocation/{idlocation}", method = RequestMethod.GET)
	public String eventEdit(@PathVariable int idlocation, Map<String, Object> map) {
		Location existingLocation =  locationService.get(idlocation);
		// Add to model
		map.put("location", existingLocation);
		map.put("sports1", existingLocation.getSports());
		map.put("sportList", sportService.listSport());
		
		return "pages/locations/editlocation";
	}

	/* Edit event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/locations/editlocation", method = RequestMethod.POST)
	public String eventEdit(@ModelAttribute("location") Location location,
			BindingResult result, Map<String, Object> map) {
		Timestamp sysdate = new Timestamp(new Date().getTime());
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		location.setChangeby(user);
		location.setChangedate(sysdate);
		locationService.updateLocation(location);
		
		return "redirect:/pages/locations/searchlocations";
	}
}
