package com.moysport.web;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Event;
import com.moysport.service.GameService;
import com.moysport.service.EventService;
import com.moysport.service.GamepartiesService;
import com.moysport.service.SportService;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	@Autowired
	SportService sportService;
	@Autowired
	GameService gameService;
	@Autowired
	GamepartiesService gamepartiesService;
	
	@RequestMapping("/table_pages/events")
	public String listEvents(Map<String, Object> map) {
		map.put("events", new Event());
		map.put("eventsList", eventService.listEvents());
		return "table_pages/events";
	}

	@RequestMapping(value = "/table_pages/events/add", method = RequestMethod.POST)
	public String addEvents(@ModelAttribute("events") Event event, BindingResult result) {
		eventService.addEvents(event);
		return "redirect:/table_pages/events";
	}

	@RequestMapping(value = "/table_pages/events/delete", method = RequestMethod.POST)
	public String deleteEvents(@RequestParam("idevent") Integer idevent) {
		eventService.removeEvents(idevent);
		return "redirect:/table_pages/events";
	}	
	
	@RequestMapping(value = "/pages/events/searchevents", method = RequestMethod.GET)
	public String searchevents(Map<String, Object> map) {
		map.put("eventsList", eventService.listEvents());
		map.put("sportList", sportService.listSport());
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/events/viewevent", method = RequestMethod.GET)
	public String viewevent(ModelMap model) {
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/pages/events/viewgame/{idgame}", method = RequestMethod.GET)
	public String viewgame(@PathVariable int idgame, Map<String, Object> map) {
		map.put("eventgame", gameService.viewEventgame(idgame));
		map.put("gameparties", gamepartiesService.listGameparties(idgame));
		return "pages/events/viewgame";
	}	
	
	@RequestMapping(value = "/pages/events/viewevent/{idevent}", method = RequestMethod.GET)
	public String viewexectevent(@PathVariable int idevent, Map<String, Object> map) {
		map.put("event", eventService.viewEvent(idevent));
		map.put("eventgames", eventService.game(idevent));
		map.put("gameparties", eventService.gameparties(idevent));
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/pages/events/editevent/{id}", method = RequestMethod.POST)
	public String editEvent(@PathVariable int idevent, @ModelAttribute("event") Event event) {

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
		ArrayList<String> params = new ArrayList<String>();
		if(idsport!=null && idsport.length()>0) params.add("s.idsport = '"+idsport+"'");
		if(location!=null && location.length()>0) params.add("l.name like '%"+location+"%'");
		if(keyword!=null && keyword.length()>0) params.add("e.name like '%"+keyword+"%'");
		map.put("eventsList", eventService.searchEvents(params));
		map.put("idsport", idsport);
		map.put("location", location);
		map.put("keyword", keyword);
		return "pages/events/searchevents";
	}
	
}
