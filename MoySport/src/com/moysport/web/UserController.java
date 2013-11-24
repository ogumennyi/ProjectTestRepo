package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.User;
import com.moysport.model.Userskill;
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
		map.put("user", new Userskill());
		map.put("userList", userService.listUser());
		return "table_pages/users";
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

}
