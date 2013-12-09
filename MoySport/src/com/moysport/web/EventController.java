package com.moysport.web;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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


import com.moysport.model.User;
import com.moysport.service.EventGameService;
import com.moysport.service.EventService;
import com.moysport.service.GamepartiesService;
import com.moysport.service.SportService;
import com.moysport.service.LocationService;
import com.moysport.service.UserService;


@Controller
public class EventController {
	
	protected static Logger logger = Logger.getLogger("controller");
	//private static final Logger logger = Logger.getLogger(UserLoader.class);

	@Autowired
	EventService eventService;
	@Autowired
	SportService sportService;
	@Autowired
	EventGameService eventGameService;
	@Autowired
	GamepartiesService gamepartiesService;
	@Autowired
	LocationService locationService;
	@Autowired
	UserService userService;
	
	
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
	

/*	Search and view mapping methods */	
	
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
            map.put("game", eventGameService.viewEventgame(idgame).get(0));
            map.put("gameparties", gamepartiesService.listGameparties(idgame));
            
            return "pages/events/viewgame";
    }        
    
    
	@RequestMapping(value = "/pages/events/viewevent/{idevent}", method = RequestMethod.GET)
	public String viewexectevent(@PathVariable int idevent, Map<String, Object> map) {
		map.put("event", eventService.viewEvent(idevent).get(0));
		map.put("eventgames", eventService.eventGame(idevent));
		map.put("gameparties", eventService.gameparties(idevent));
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
	
    /*	Create/Edit methods for EventGame, Event*/	

    /*	Create event , GET method, user fills out the form*/	

	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.GET)
	public String getCreateEvent(Map<String, Object> map) {
		map.put("sportList", sportService.listSport());
		map.put("locationList", locationService.listLocations());
        map.put("event", new Event());
		return "pages/events/createevent";
	}

	/*	Create event, POST method,  Data from Form updates Model */	

	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.POST)
	public String postCreateEvent(@RequestParam("idSport") int idsport, @RequestParam("idlocation") int idlocation, @ModelAttribute("event") Event event, BindingResult result,Map<String, Object> map) {
		eventService.add(event,idlocation,idsport);
		return "pages/events/searchevents";

	}
	
    /*	Edit event, GET method , user fills out the form*/	

    @RequestMapping(value = "/pages/events/editevent/{idevent}", method = RequestMethod.GET)
    public String getEventEdit(@PathVariable int idevent,  Map<String, Object> map) {
      
     Event existingEvent = eventService.get(idevent);
     // Add to model
     map.put("event", existingEvent);

     map.put("idlocation", existingEvent.getLocations().getIdlocation());
     map.put("idsport", existingEvent.getSport().getIdsport());
     map.put("sportList", sportService.listSport());
	 map.put("locationList", locationService.listLocations());
	 map.put("eventgames", eventService.eventGame(idevent));

	 return "pages/events/editevent";
    }
    
	/*	Edit event, POST method, Data from Form updates Model */	

    @RequestMapping(value = "/pages/events/editevent", method = RequestMethod.POST)
    public String postEventEdit(@RequestParam("idsport") int idsport, @RequestParam("idlocation") int idlocation, @ModelAttribute("event") Event event, BindingResult result,Map<String, Object> map) {
	
    	event.setLocations(locationService.get(idlocation));
    	event.setSport(sportService.get(idsport));
      	eventService.update(event);
  
	 return "pages/events/searchevents";
    }
    
    
	/*	Create game, GET method,  user fills out the form */	

	@RequestMapping(value = "/pages/events/creategame", method = RequestMethod.GET)
	public String getCreateEventGame(Map<String, Object> map) {
		map.put("eventList", eventService.listEvents());
        map.put("game", new EventGame());
		return "pages/events/creategame";
	}
	
	/*	Create game, POST method, Data from Form updates Model */	
	
	@RequestMapping(value = "/pages/events/creategame", method = RequestMethod.POST)
	public String postCreateEventGame(@RequestParam("idevent") int idevent, @ModelAttribute("game") EventGame eventGame, BindingResult result,Map<String, Object> map) {
		eventGameService.add(eventGame,idevent);

		return "pages/events/searchevents";
	}
	

    /*	Edit event, GET method , user fills out the form*/	
	@RequestMapping(value = "/pages/events/editgame/{idgame}", method = RequestMethod.GET)
	public String getEditEventGame(@PathVariable int idgame,  Map<String, Object> map) {
		// need to rewrite gameparties service and DAO methods to get specific gameparties instance (see locationService.get etc,)
		
		EventGame existingEventGame = eventGameService.get(idgame);

		String firstname = userService.getplayer(existingEventGame.getEvents().getIdcreatedby()).getFirstname();
		String lastname = userService.getplayer(existingEventGame.getEvents().getIdcreatedby()).getLastname();
		String phone = userService.getplayer(existingEventGame.getEvents().getIdcreatedby()).getMphone();
		String eventname = eventService.get(existingEventGame.getEvents().getIdevent()).getName();
		String sportname = eventService.get(existingEventGame.getEvents().getIdevent()).getSport().getName();

		map.put("eventname",eventname);
		map.put("sportname", sportname);
		map.put("firstname",firstname);
		map.put("lastname", lastname);
		map.put("phone",phone);
		map.put("creatorId", existingEventGame.getEvents().getIdcreatedby());
		map.put("eventgame", existingEventGame);
		
		//if(!gamepartiesService.listGameparties(idgame).isEmpty()) {
			 map.put("gameparties", gamepartiesService.listGameparties(idgame));
		 //}

	 return "pages/events/editgame";

	}
	
	/*	Edit game, POST method, Data from Form updates Model */	

	@RequestMapping(value = "/pages/events/editgame", method = RequestMethod.POST)
	public String postEditEventGame(@RequestParam("idgame") int idgame, @ModelAttribute("game") EventGame eventGame, BindingResult result,Map<String, Object> map) {
		
    	//event.setLocations(locationService.get(idlocation));
    	//event.setSport(sportService.get(idsport));
      	//eventService.update(event);
      	
		eventGameService.update(eventGame,idgame);
		
		//map.put("game", eventGameService.viewEventgame(eventGame.getIdgame()).get(0)); // send GAME object(not LIST ) to VIEW
		//map.put("gameparties", gamepartiesService.listGameparties(eventGame.getIdgame()));
		
		return "pages/events/searchevents";
	}
	
	
}
