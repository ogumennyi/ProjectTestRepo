package com.moysport.web;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.moysport.model.Event;
import com.moysport.model.Sport;
import com.moysport.model.EventGame;


import com.moysport.service.GameService;
import com.moysport.service.EventService;
import com.moysport.service.GamepartiesService;
import com.moysport.service.SportService;
import com.moysport.service.LocationService;


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
	@Autowired
	LocationService locationService;
	
	// to save Date time fields
	@InitBinder
	public void binder(WebDataBinder binder) {binder.registerCustomEditor(Timestamp.class,
	    new PropertyEditorSupport() {
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
	
	@RequestMapping("/table_pages/events")
	public String listEvents(Map<String, Object> map) {
		map.put("events", new Event());
		map.put("eventsList", eventService.listEvents());
		return "table_pages/events";
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
	
	//@RequestMapping(value = "/pages/events/viewgame/{idgame}", method = RequestMethod.GET)
	//public String viewgame(@PathVariable int idgame, Map<String, Object> map) {
	//	map.put("eventgame", gameService.viewEventgame(idgame));
		//map.put("gameparties", gamepartiesService.listGameparties(idgame));
	//	return "pages/events/viewgame";
	//}	
    @RequestMapping(value = "/pages/events/viewgame/{idgame}", method = RequestMethod.GET)
    public String viewgame(@PathVariable int idgame, Map<String, Object> map) {
            map.put("game", gameService.viewEventgame(idgame).get(0));
            map.put("gameparties", gamepartiesService.listGameparties(idgame));
            
            return "pages/events/viewgame";
    }        
    
    
	@RequestMapping(value = "/pages/events/viewevent/{idevent}", method = RequestMethod.GET)
	public String viewexectevent(@PathVariable int idevent, Map<String, Object> map) {
		map.put("event", eventService.viewEvent(idevent).get(0));
		map.put("eventgames", eventService.eventGame(idevent));
		map.put("gameparties", eventService.gameparties(idevent));
		return "pages/events/viewevent";
	//return "pages/events/searchevents";
	}
	
//	@RequestMapping(value = "/pages/events/editevent/{idevent}", method = RequestMethod.POST)
	//public String editEvent(@PathVariable int idevent, @ModelAttribute("event") Event event) {
	//	return "pages/events/viewevent";
	//}
		
	@RequestMapping(value = "/pages/events/addevent", method = RequestMethod.POST)
	public String addEvents(@RequestParam("idSport") int idsport, @RequestParam("idlocation") int idlocation, @ModelAttribute("event") Event event, BindingResult result,Map<String, Object> map) {
		eventService.addEvents(event,idsport,idlocation);
		//map.put("event", eventService.viewEvent(event.getIdevent()).get(0)); // send EVENT object(not LIST ) to VIEW
		//return "pages/events/viewevent";
		//return "pages/events/searchevents";
		return "pages/events/searchevents";


	}
	
	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.GET)
	public String CreateEventForm(Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		map.put("locationList", locationService.listLocations());
        map.put("event", new Event());
		return "pages/events/createevent";
	}
		
	@RequestMapping(value = "/pages/events/creategame", method = RequestMethod.GET)
	public String CreateGameForm(Map<String, Object> map) {
		map.put("eventList", eventService.listEvents());
        map.put("game", new EventGame());
		return "pages/events/creategame";
	}
	
	@RequestMapping(value = "/pages/events/addgame", method = RequestMethod.POST)
	public String addEvents(@RequestParam("idevent") int idevent, @ModelAttribute("game") EventGame eventGame, BindingResult result,Map<String, Object> map) {
		gameService.addGame(eventGame,idevent);
		map.put("game", gameService.viewEventgame(eventGame.getIdgame()).get(0)); // send GAME object(not LIST ) to VIEW
		map.put("gameparties", gamepartiesService.listGameparties(eventGame.getIdgame()));
		return "pages/events/viewgame";
	}
	
	@RequestMapping(value = "/pages/events/editgame", method = RequestMethod.POST)
	public String saveEvent(@RequestParam("idgame") int idgame, @ModelAttribute("game") EventGame eventGame, BindingResult result,Map<String, Object> map) {
		gameService.addGame(eventGame,idgame);
		map.put("game", gameService.viewEventgame(eventGame.getIdgame()).get(0)); // send GAME object(not LIST ) to VIEW
		map.put("gameparties", gamepartiesService.listGameparties(eventGame.getIdgame()));
		return "pages/events/viewgame";
	}
	
	@RequestMapping(value = "/pages/events/editgame/{idgame}", method = RequestMethod.GET)
	public String editEvent(@PathVariable int idgame, @ModelAttribute("game") Event event, Map<String, Object> map) {
		map.put("game", gameService.viewEventgame(idgame).get(0));
        //KCSUser user = service.find(userId);
		return "pages/events/editgame";
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
