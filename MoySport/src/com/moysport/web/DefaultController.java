package com.moysport.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
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
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model) {
		return "index";
	}
	
	@RequestMapping(value = "/authorization", method = RequestMethod.GET)
	public String authorozation(ModelMap model) {
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
	
	@RequestMapping(value = "/pages/user/home", method = RequestMethod.GET)
	public String home(ModelMap model) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "pages/user/home";
	}
	
	@RequestMapping(value = "/pages/user/editprofile", method = RequestMethod.GET)
	public String editprofile(ModelMap model) {
		return "pages/user/editprofile";
	}
	
	@RequestMapping(value = "/pages/user/saveprofile", method = RequestMethod.POST)
	public String saveprofile(ModelMap model) {
		return "pages/user/home";
	}
	
	@RequestMapping(value = "/pages/user/events", method = RequestMethod.GET)
	public String events(ModelMap model) {
		return "pages/user/events";
	}
	
	@RequestMapping(value = "/pages/user/friends", method = RequestMethod.GET)
	public String friends(ModelMap model) {
		return "pages/user/friends";
	}

	@RequestMapping(value = "/pages/user/trainings", method = RequestMethod.GET)
	public String trainings(ModelMap model) {
		return "pages/user/trainings";
	}
	
	@RequestMapping(value = "/pages/user/settings", method = RequestMethod.GET)
	public String settings(ModelMap model) {
		return "pages/user/settings";
	}
	
	@RequestMapping(value = "/pages/user/help", method = RequestMethod.GET)
	public String help(ModelMap model) {
		return "pages/user/help";
	}
	
	@RequestMapping(value = "/pages/events/searchevents", method = RequestMethod.GET)
	public String searchevents(ModelMap model) {
		return "pages/events/searchevents";
	}
	
	@RequestMapping(value = "/pages/events/viewevent", method = RequestMethod.GET)
	public String viewevent(ModelMap model) {
		return "pages/events/viewevent";
	}
	
	@RequestMapping(value = "/pages/events/createevent", method = RequestMethod.GET)
	public String createevent(ModelMap model) {
		return "pages/events/createevent";
	}
	
	@RequestMapping(value = "/pages/events/addevent", method = RequestMethod.POST)
	public String addevent(ModelMap model) {
		return "pages/events/viewevent";
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
	
	@RequestMapping(value = "/accessdenied")
	public String accessdenied(ModelMap model) {
		return "accessDenied";
	}
	
	@RequestMapping(value = "/timeout")
	public String timeout(ModelMap model) {
		return "timeout";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "authorization";
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
