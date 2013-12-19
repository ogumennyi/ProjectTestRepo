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

import com.moysport.model.EventGame;
import com.moysport.model.GameParty;
import com.moysport.model.User;
import com.moysport.service.GamePartyService;

@Controller
public class GamePartyController {
	
	@Autowired
	private GamePartyService gamePartyService;

	@RequestMapping("/table_pages/gameparties")
	public String listGameparties(Map<String, Object> map) {
		map.put("gameparties", new GameParty());
		map.put("gamepartiesList", gamePartyService.listGameparties());
		return "table_pages/gameparties";
	}

	@RequestMapping(value = "/table_pages/gameparties/add", method = RequestMethod.POST)
	public String addGameparties(@ModelAttribute("gameparties") GameParty gameparties, BindingResult result) {
		gamePartyService.addGameparties(gameparties);
		return "redirect:/table_pages/gameparties";
	}

	@RequestMapping(value = "/table_pages/gameparties/delete", method = RequestMethod.POST)
	public String deleteGameparties(@RequestParam("idGp") Integer idGp) {
		gamePartyService.removeGameparties(idGp);
		return "redirect:/table_pages/gameparties";
	}
	
	@RequestMapping(value = "/acceptgame", method = RequestMethod.POST)
	public String acceptGame(@RequestParam("idgame") int idgame){
		GameParty gameparties = new GameParty();
		EventGame eventgames = new EventGame();
		eventgames.setIdgame(idgame);
		gameparties.setEventgames(eventgames);
		gameparties.setUser((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		gamePartyService.addGameparties(gameparties);
		return "redirect:/pages/events/viewgame/"+idgame;
	}
	
	@RequestMapping(value = "/declinegame", method = RequestMethod.POST)
	public String declineGame(@RequestParam("idgame") int idgame, @RequestParam("idgp") int idgp){
		gamePartyService.removeGameparties(idgp);
		return "redirect:/pages/events/viewgame/"+idgame;
	}	

}
