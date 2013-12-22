package com.moysport.web;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Event;
import com.moysport.model.User;
import com.moysport.service.EventGameService;
import com.moysport.service.EventService;
import com.moysport.service.GamePartyService;
import com.moysport.service.LocationService;
import com.moysport.service.SportService;
import com.moysport.service.UserService;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	@Autowired
	SportService sportService;
	@Autowired
	EventGameService eventGameService;
	@Autowired
	GamePartyService gamePartyService;
	@Autowired
	LocationService locationService;
	@Autowired
	UserService userService;

	// to save Date time fields
	@InitBinder
	public void binder(WebDataBinder binder) {
		binder.registerCustomEditor(Timestamp.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					Date parsedDate = new SimpleDateFormat("dd.MM.yyyy HH:mm").parse(value);
					setValue(new Timestamp(parsedDate.getTime()));
				} catch (ParseException e) {
					setValue(null);
				}
			}
		});
	}

	@RequestMapping(value = "/pages/events/searchevents", method = RequestMethod.GET)
	public String searchEvents(Map<String, Object> map) {
		map.put("eventsList", eventService.searchEvents());
		map.put("sportList", sportService.listSport());
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/events/search", method = RequestMethod.POST)
	public String searchEvents(@RequestParam("idsport") String idsport, @RequestParam("location") String location, @RequestParam("keyword") String keyword,
			Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		HashMap<String, String> params = new HashMap<String, String>();
		if (idsport != null && idsport.length() > 0)
			params.put("idsport", "sport.idsport='" + idsport + "'");
		if (location != null && location.length() > 0)
			params.put("location", "locations.name like '%" + location + "%'");
		if (keyword != null && keyword.length() > 0)
			params.put("keyword", "name like '%" + keyword + "%'");
		map.put("eventsList", eventService.searchEvents(params));
		map.put("idsport", idsport);
		map.put("location", location);
		map.put("keyword", keyword);
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/events/viewevent/{idevent}", method = RequestMethod.GET)
	public String viewEvent(@PathVariable int idevent, Map<String, Object> map) {
		map.put("event", eventService.getEventWithParties(idevent));
		return "pages/events/viewevent";
	}

	/* Create/Edit methods for EventGame, Event */
	/* Create event , GET method, user fills out the form */
	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.GET)
	public String createEvent(Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		map.put("locationList", locationService.listLocations());
		map.put("event", new Event());
		return "pages/events/createevent";
	}

	/* Create event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.POST)
	public String createEvent(@RequestParam("idSport") int idsport, @RequestParam("idlocation") int idlocation, @ModelAttribute("event") Event event,
			BindingResult result, Map<String, Object> map) {
		java.util.Date date = new java.util.Date();
		long time = date.getTime();

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		event.setIdchangeby(user.getIduser());
		event.setCreatedby(user);
		event.setMark(0);
		event.setMarkcnt(0);
		event.setChangedate(new Timestamp(time));
		eventService.add(event, idlocation, idsport);
		return "redirect:/pages/events/searchevents";
	}

	/* Edit event, GET method , user fills out the form */
	@RequestMapping(value = "/pages/events/editevent/{idevent}", method = RequestMethod.GET)
	public String eventEdit(@PathVariable int idevent, Map<String, Object> map) {
		Event existingEvent = eventService.getEvent(idevent);
		// Add to model
		map.put("event", existingEvent);
		map.put("idlocation", existingEvent.getLocations().getIdlocation());
		map.put("idsport", existingEvent.getSport().getIdsport());
		map.put("sportList", sportService.listSport());
		map.put("locationList", locationService.listLocations());
		map.put("eventgames", eventGameService.getAll(idevent));

		return "pages/events/editevent";
	}

	/* Edit event, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/events/editevent", method = RequestMethod.POST)
	public String eventEdit(@RequestParam("idsport") int idsport, @RequestParam("idlocation") int idlocation, @ModelAttribute("event") Event event,
			BindingResult result, Map<String, Object> map) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		event.setIdchangeby(user.getIduser());
		java.util.Date date = new java.util.Date();
		long time = date.getTime();
		event.setChangedate(new Timestamp(time));
		event.setLocations(locationService.get(idlocation));
		event.setSport(sportService.get(idsport));
		eventService.updateEvent(event);

		return "redirect:/pages/events/searchevents";
	}

}
