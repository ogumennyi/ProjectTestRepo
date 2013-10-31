package com.moysport.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.moysport.model.User;
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

}
