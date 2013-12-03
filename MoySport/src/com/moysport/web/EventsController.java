package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	private EventsService eventsService;

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

}
