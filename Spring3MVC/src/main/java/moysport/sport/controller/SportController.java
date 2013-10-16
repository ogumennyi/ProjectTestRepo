package moysport.sport.controller;

import java.util.Map;

import moysport.sport.form.Sport;
import moysport.sport.service.SportService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SportController {
	
	@Autowired
	private SportService sportService;
	
	@RequestMapping({"/"})
	public ModelAndView helloWorld() {
		String message = "<a href='sport'>Welcome to MoySport!</a>";
		System.out.println(message);
		return new ModelAndView("index", "message", message);
	}
	
	@RequestMapping("/sport")
	public String listContacts(Map<String, Object> map) {
		map.put("sport", new Sport());
		map.put("sportList", sportService.listSport());
		return "sport";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("sport") Sport sport, BindingResult result) {
		sportService.addSport(sport);
		return "redirect:/sport";
	}
	
	@RequestMapping("/delete/{sportId}")
	public String deleteContact(@PathVariable("sportId") Integer sportId) {
		sportService.removeSport(sportId);
		return "redirect:/sport";
	}

}
