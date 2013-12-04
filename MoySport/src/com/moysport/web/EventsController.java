package com.moysport.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Events;
import com.moysport.service.EventsService;

@Controller
public class EventsController {

	@Autowired
	EventsService eventsService;
	
	@RequestMapping("/table_pages/events")
	public String listEvents(Map<String, Object> map) {
		map.put("events", new Events());
		map.put("eventsList", eventsService.listEvents());
		return "table_pages/events";
	}

	@RequestMapping(value = "/table_pages/events/add", method = RequestMethod.POST)
	public String addEvents(@ModelAttribute("events") Events events, BindingResult result) {
		eventsService.addEvents(events);
		return "redirect:/table_pages/events";
	}

	@RequestMapping(value = "/table_pages/events/delete", method = RequestMethod.POST)
	public String deleteEvents(@RequestParam("idevent") Integer idevent) {
		eventsService.removeEvents(idevent);
		return "redirect:/table_pages/events";
	}	
	
	@RequestMapping(value = "/pages/events/searchevents", method = RequestMethod.GET)
	public String searchevents(Map<String, Object> map) {
		map.put("eventsList", eventsService.listEvents());
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/events/viewevent", method = RequestMethod.GET)
	public String viewevent(ModelMap model) {
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.GET)
	public String createevent(ModelMap model) {
		return "pages/events/createevent";
	}
	
	@RequestMapping(value = "/pages/events/addevent", method = RequestMethod.POST)
	public String addevent(ModelMap model) {
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/events/search", method = RequestMethod.POST)
	public String searchevents(@RequestParam("sport") String sport, Map<String, Object> map) {
		HashMap<String, String> params = new HashMap<String, String>();
		if(sport!=null && sport.length()>0) params.put("s.idsport", sport);
		map.put("eventsList", eventsService.searchEvents(params));
		return "pages/events/searchevents";
	}
	
}
