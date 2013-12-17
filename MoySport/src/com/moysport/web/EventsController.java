package com.moysport.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Events;
import com.moysport.model.User;
import com.moysport.service.EventgamesService;
import com.moysport.service.EventsService;
import com.moysport.service.GamepartiesService;
import com.moysport.service.SportService;

@Controller
public class EventsController {

	@Autowired
	EventsService eventsService;
	@Autowired
	SportService sportService;
	@Autowired
	EventgamesService eventgamesService;
	@Autowired
	GamepartiesService gamepartiesService;
	
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
		map.put("sportList", sportService.listSport());
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/events/viewevent", method = RequestMethod.GET)
	public String viewevent(ModelMap model) {
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/pages/events/viewgame/{idgame}", method = RequestMethod.GET)
	public String viewgame(@PathVariable int idgame, Map<String, Object> map) {
		map.put("eventgame", eventgamesService.viewEventgame(idgame));
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		map.put("user", user);
		//map.put("gameparties", gamepartiesService.listGameparties(idgame));
		return "pages/events/viewgame";
	}	
	
	@RequestMapping(value = "/pages/events/viewevent/{idevent}", method = RequestMethod.GET)
	public String viewevent(@PathVariable int idevent, Map<String, Object> map) {
		map.put("event", eventsService.viewEvent(idevent));
		//map.put("eventgames", eventsService.eventgames(idevent));
		//map.put("gameparties", eventsService.gameparties(idevent));
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
	public String searchevents(@RequestParam("idsport") String idsport, @RequestParam("location") String location, @RequestParam("keyword") String keyword, Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		HashMap<String, String> params = new HashMap<String, String>();
		if(idsport!=null && idsport.length()>0) params.put("idsport", "sport.idsport='"+idsport+"'");
		if(location!=null && location.length()>0) params.put("location", "locations.name like '%"+location+"%'");
		if(keyword!=null && keyword.length()>0) params.put("keyword", "name like '%"+keyword+"%'");
		map.put("eventsList", eventsService.searchEvents(params));
		map.put("idsport", idsport);
		map.put("location", location);
		map.put("keyword", keyword);
		return "pages/events/searchevents";
	}
	
}
