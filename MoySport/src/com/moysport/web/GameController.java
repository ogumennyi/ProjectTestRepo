package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Event;
import com.moysport.model.EventGame;
import com.moysport.service.EventGameService;

@Controller
public class GameController {
	
	@Autowired
	private EventGameService eventGameService;

	@RequestMapping("/table_pages/eventgames")
	public String listEventgames(Map<String, Object> map) {
		map.put("eventgames", new EventGame());
		map.put("eventgamesList", eventGameService.listEventgames());
		return "table_pages/eventgames";
	}

	//@RequestMapping(value = "/table_pages/eventgames/add", method = RequestMethod.POST)
	//public String addEventgames(@ModelAttribute("eventgames") EventGame game, BindingResult result) {
	//	eventGameService.addEventgames(game);
	//	return "redirect:/table_pages/eventgames";
	//}

	@RequestMapping(value = "/table_pages/eventgames/delete", method = RequestMethod.POST)
	public String deleteEventgames(@RequestParam("idGame") Integer idGame) {
		eventGameService.removeEventgames(idGame);
		return "redirect:/table_pages/eventgames";
	}
	
	



}
