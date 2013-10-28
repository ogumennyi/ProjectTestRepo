package com.moysport.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DefaultController {

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
