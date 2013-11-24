package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Eventgames;
import com.moysport.service.EventgamesService;

@Controller
public class EventgamesController {
	
	@Autowired
	private EventgamesService eventgamesService;

	@RequestMapping("/table_pages/eventgames")
	public String listEventgames(Map<String, Object> map) {
		map.put("eventgames", new Eventgames());
		map.put("eventgamesList", eventgamesService.listEventgames());
		return "table_pages/eventgames";
	}

	@RequestMapping(value = "/table_pages/eventgames/add", method = RequestMethod.POST)
	public String addEventgames(@ModelAttribute("eventgames") Eventgames eventgames, BindingResult result) {
		eventgamesService.addEventgames(eventgames);
		return "redirect:/table_pages/eventgames";
	}

	@RequestMapping(value = "/table_pages/eventgames/delete", method = RequestMethod.POST)
	public String deleteEventgames(@RequestParam("idGame") Integer idGame) {
		eventgamesService.removeEventgames(idGame);
		return "redirect:/table_pages/eventgames";
	}

}
