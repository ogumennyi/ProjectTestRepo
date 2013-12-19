package com.moysport.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.moysport.model.User;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public ModelAndView welcome() {
		return new ModelAndView("authorization");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "authorization";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("auth", "fail");
		return "authorization";
	}
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(ModelMap model) {
		return "authorization";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registration(ModelMap model) {
		model.addAttribute("user", new User());
		model.addAttribute("auth", "new");
		return "registration";
	}

	@RequestMapping(value = "/pages/mainpage", method = RequestMethod.GET)
	public String mainpage(ModelMap model) {
		return "pages/mainpage";
	}

	@RequestMapping(value = "/pages/players/searchplayers", method = RequestMethod.GET)
	public String searchplayers(ModelMap model) {
		return "pages/players/searchplayers";
	}
	
	@RequestMapping(value = "/pages/players/viewplayer", method = RequestMethod.GET)
	public String viewplayer(ModelMap model) {
		return "pages/players/viewplayer";
	}
	
	@RequestMapping(value = "/pages/locations/searchlocations", method = RequestMethod.GET)
	public String searchlocations(ModelMap model) {
		return "pages/locations/searchlocations";
	}
	
	@RequestMapping(value = "/pages/locations/viewlocation", method = RequestMethod.GET)
	public String viewlocation(ModelMap model) {
		return "pages/locations/viewlocation";
	}
	
	@RequestMapping(value = "/pages/locations/createlocation", method = RequestMethod.GET)
	public String createlocation(ModelMap model) {
		return "pages/locations/createlocation";
	}
	
	@RequestMapping(value = "/pages/locations/addlocation", method = RequestMethod.POST)
	public String addlocation(ModelMap model) {
		return "pages/locations/viewlocation";
	}	
	
	@RequestMapping(value = "/pages/search", method = RequestMethod.GET)
	public String search(ModelMap model) {
		return "pages/search";
	}
	
	@RequestMapping(value = "/pages/quicksearch", method = RequestMethod.POST)
	public String quicksearch(ModelMap model) {
		return "pages/search";
	}
	
	@RequestMapping(value = "/accessdenied")
	public String accessdenied(ModelMap model) {
		return "temp/accessDenied";
	}
	
	@RequestMapping(value = "/timeout")
	public String timeout(ModelMap model) {
		return "temp/timeout";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "authorization";
	}
	
	// Temp goes below
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "temp/index";
	}

	@RequestMapping("/employee/list.html")
	public ModelAndView gotoEmployee(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView("temp/employee/list");
		return mav;
	}

	@RequestMapping("/admin/home.html")
	public ModelAndView gotoAdmin(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception {
		ModelAndView mav = new ModelAndView("temp/admin/home");
		return mav;
	}	

}
