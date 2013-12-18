package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.User;
import com.moysport.model.UserSkill;
import com.moysport.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/user")
	public String getUserForLogin(ModelMap model) throws Exception {
		model.addAttribute("user", new User());
		model.addAttribute("auth", "new");
		return "login";
	}
	
	@RequestMapping(value = "/user/new", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, BindingResult result) {
		userService.addUser(user);
		return "redirect:/login";
	}
	
	@RequestMapping("/table_pages/users")
	public String listUserskill(Map<String, Object> map) {
		map.put("user", new UserSkill());
		map.put("userList", userService.listUser());
		return "table_pages/users";
	}
	
	@RequestMapping(value = "/pages/players/viewplayer/{iduser}", method = RequestMethod.GET)
	public String viewuser(@PathVariable int iduser, Map<String, Object> map) {
		map.put("user", userService.getplayer(iduser));
		return "pages/players/viewplayer";
	}	

	@RequestMapping(value = "/table_pages/users/add", method = RequestMethod.POST)
	public String addUserskill(@ModelAttribute("user") User user, BindingResult result) {
		userService.addUser(user);
		return "redirect:/table_pages/users";
	}

	@RequestMapping(value = "/table_pages/users/delete", method = RequestMethod.POST)
	public String deleteUserskill(@RequestParam("idUser") Integer idUser) {
		userService.removeUser(idUser);
		return "redirect:/table_pages/users";
	}
	
	@RequestMapping(value = "/userhome", method = RequestMethod.GET)
	public String userhome(ModelMap model) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "user/userData";
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

}
