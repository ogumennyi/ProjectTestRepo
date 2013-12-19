package com.moysport.web;

import java.beans.PropertyEditorSupport;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.moysport.model.EventGame;
import com.moysport.model.User;
import com.moysport.service.EventGameService;
import com.moysport.service.EventService;
import com.moysport.service.GamePartyService;
import com.moysport.service.UserService;

@Controller
public class EventGameController {
	
	@Autowired
	private EventGameService eventGameService;
	@Autowired
	EventService eventService;
	@Autowired
	UserService userService;
	@Autowired
	GamePartyService gamePartyService;
	
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
	
	@RequestMapping(value = "/pages/events/viewgame/{idgame}", method = RequestMethod.GET)
	public String viewGame(@PathVariable int idgame, Map<String, Object> map) {
		map.put("eventgame", eventGameService.viewEventgame(idgame));
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		map.put("user", user);
		return "pages/events/viewgame";
	}
	
	/* Create game, GET method, user fills out the form */
	@RequestMapping(value = "/pages/events/creategame", method = RequestMethod.GET)
	public String createEventGame(Map<String, Object> map) {
		map.put("eventList", eventService.listEvents());
		map.put("game", new EventGame());
		return "pages/events/creategame";
	}

	/* Create game, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/events/creategame", method = RequestMethod.POST)
	public String createEventGame(@RequestParam("idevent") int idevent, @ModelAttribute("game") EventGame eventGame, BindingResult result,
			Map<String, Object> map) {
		eventGameService.add(eventGame, idevent);
		return "redirect:/pages/events/searchevents";
	}

	/* Edit event, GET method , user fills out the form */
	@RequestMapping(value = "/pages/events/editgame/{idgame}", method = RequestMethod.GET)
	public String editEventGame(@PathVariable int idgame, Map<String, Object> map) {
		// TODO need to rewrite gameparties service and DAO methods to get specific gameparties instance (see locationService.get etc,)

		EventGame existingEventGame = eventGameService.get(idgame);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername(); // get logged in username
		String firstname = userService.getplayer(existingEventGame.getEvents().getCreatedby().getIduser()).getFirstname();
		String lastname = userService.getplayer(existingEventGame.getEvents().getCreatedby().getIduser()).getLastname();
		String phone = userService.getplayer(existingEventGame.getEvents().getCreatedby().getIduser()).getMphone();
		String eventname = eventService.getEvent(existingEventGame.getEvents().getIdevent()).getName();
		String sportname = eventService.getEvent(existingEventGame.getEvents().getIdevent()).getSport().getName();

		map.put("eventname", eventname);
		map.put("sportname", sportname);
		map.put("firstname", firstname);
		map.put("lastname", lastname);
		map.put("phone", phone);
		map.put("creatorId", existingEventGame.getEvents().getCreatedby().getIduser());
		map.put("eventgame", existingEventGame);
		map.put("username", username);
		map.put("gameparties", gamePartyService.listGameparties(idgame));

		return "pages/events/editgame";

	}

	/* Edit game, POST method, Data from Form updates Model */
	@RequestMapping(value = "/pages/events/editgame", method = RequestMethod.POST)
	public String editEventGame(@RequestParam("idgame") int idgame, @ModelAttribute("game") EventGame eventGame, BindingResult result,
			Map<String, Object> map) {
		eventGameService.update(eventGame, idgame);
		return "pages/events/searchevents";
	}	

}
