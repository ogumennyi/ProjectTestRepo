package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.GameRating;
import com.moysport.service.GameRatingService;

@Controller
public class GameRatingController {
	
	@Autowired
	private GameRatingService gameRatingService;

	@RequestMapping("/table_pages/gameratings")
	public String listGameratings(Map<String, Object> map) {
		map.put("gameratings", new GameRating());
		map.put("gameratingsList", gameRatingService.listGameratings());
		return "table_pages/gameratings";
	}

	@RequestMapping(value = "/table_pages/gameratings/add", method = RequestMethod.POST)
	public String addGameratings(@ModelAttribute("gameratings") GameRating gameratings, BindingResult result) {
		gameRatingService.addGameratings(gameratings);
		return "redirect:/table_pages/gameratings";
	}

	@RequestMapping(value = "/table_pages/gameratings/delete", method = RequestMethod.POST)
	public String deleteGameratings(@RequestParam("idgr") Integer idgr) {
		gameRatingService.removeGameratings(idgr);
		return "redirect:/table_pages/gameratings";
	}
}
