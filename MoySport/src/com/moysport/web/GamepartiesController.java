package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Eventgames;
import com.moysport.model.Gameparties;
import com.moysport.model.User;
import com.moysport.service.GamepartiesService;

@Controller
public class GamepartiesController {
	
	@Autowired
	private GamepartiesService gamepartiesService;

	@RequestMapping("/table_pages/gameparties")
	public String listGameparties(Map<String, Object> map) {
		map.put("gameparties", new Gameparties());
		map.put("gamepartiesList", gamepartiesService.listGameparties());
		return "table_pages/gameparties";
	}

	@RequestMapping(value = "/table_pages/gameparties/add", method = RequestMethod.POST)
	public String addGameparties(@ModelAttribute("gameparties") Gameparties gameparties, BindingResult result) {
		gamepartiesService.addGameparties(gameparties);
		return "redirect:/table_pages/gameparties";
	}

	@RequestMapping(value = "/table_pages/gameparties/delete", method = RequestMethod.POST)
	public String deleteGameparties(@RequestParam("idGp") Integer idGp) {
		gamepartiesService.removeGameparties(idGp);
		return "redirect:/table_pages/gameparties";
	}
	
	@RequestMapping(value = "/acceptgame", method = RequestMethod.POST)
	public String acceptGame(@RequestParam("idgame") int idgame){
		Gameparties gameparties = new Gameparties();
		Eventgames eventgames = new Eventgames();
		eventgames.setIdgame(idgame);
		gameparties.setEventgames(eventgames);
		gameparties.setUser((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		gamepartiesService.addGameparties(gameparties);
		return "redirect:/pages/events/viewgame/"+idgame;
	}
	
	@RequestMapping(value = "/declinegame", method = RequestMethod.POST)
	public String declineGame(@RequestParam("idgame") int idgame, @RequestParam("idgp") int idgp){
		gamepartiesService.removeGameparties(idgp);
		return "redirect:/pages/events/viewgame/"+idgame;
	}	

}
