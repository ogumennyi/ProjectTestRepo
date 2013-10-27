package com.moysport.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.moysport.model.Sport;
import com.moysport.service.SportService;

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

	@RequestMapping("/sport")
	public String listContacts(Map<String, Object> map) {
		map.put("sport", new Sport());
		map.put("sportList", sportService.listSport());
		return "sport";
	}

	@RequestMapping(value = "/sport/add", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("sport") Sport sport, BindingResult result) {
		sportService.addSport(sport);
		return "redirect:/sport";
	}

	@RequestMapping("/sport/delete/{sportId}")
	public String deleteContact(@PathVariable("sportId") Integer sportId) {
		sportService.removeSport(sportId);
		return "redirect:/sport";
	}

	@RequestMapping("/employee/list.html")
	public ModelAndView gotoEmployee(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView("employee/list");
		return mav;
	}

	@RequestMapping("/admin/home.html")
	public ModelAndView gotoAdmin(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}

}
