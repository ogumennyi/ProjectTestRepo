package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Gameratings;
import com.moysport.service.GameratingsService;

@Controller
public class GameratingsController {
	
	@Autowired
	private GameratingsService gameratingsService;

	@RequestMapping("/table_pages/gameratings")
	public String listGameratings(Map<String, Object> map) {
		map.put("gameratings", new Gameratings());
		map.put("gameratingsList", gameratingsService.listGameratings());
		return "table_pages/gameratings";
	}

	@RequestMapping(value = "/table_pages/gameratings/add", method = RequestMethod.POST)
	public String addGameratings(@ModelAttribute("gameratings") Gameratings gameratings, BindingResult result) {
		gameratingsService.addGameratings(gameratings);
		return "redirect:/table_pages/gameratings";
	}

	@RequestMapping(value = "/table_pages/gameratings/delete", method = RequestMethod.POST)
	public String deleteGameratings(@RequestParam("idgr") Integer idgr) {
		gameratingsService.removeGameratings(idgr);
		return "redirect:/table_pages/gameratings";
	}
}
