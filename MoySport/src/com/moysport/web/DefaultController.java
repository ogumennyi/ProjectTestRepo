package com.moysport.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public ModelAndView helloWorld() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("auth", "fail");
		return "login";
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
		return "index";
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
