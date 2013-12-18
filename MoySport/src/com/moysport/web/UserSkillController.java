package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.UserSkill;
import com.moysport.service.UserSkillService;

@Controller
public class UserSkillController {
	
	@Autowired
	private UserSkillService userskillService;

	@RequestMapping("/table_pages/userskill")
	public String listUserskill(Map<String, Object> map) {
		map.put("userskill", new UserSkill());
		map.put("userskillList", userskillService.listUserskill());
		return "table_pages/userskill";
	}

	@RequestMapping(value = "/table_pages/userskill/add", method = RequestMethod.POST)
	public String addUserskill(@ModelAttribute("userskill") UserSkill userskill, BindingResult result) {
		userskillService.addUserskill(userskill);
		return "redirect:/table_pages/userskill";
	}

	@RequestMapping(value = "/table_pages/userskill/delete", method = RequestMethod.POST)
	public String deleteUserskill(@RequestParam("iD") Integer iD) {
		userskillService.removeUserskill(iD);
		return "redirect:/table_pages/userskill";
	}

}
