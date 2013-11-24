package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Trainingplan;
import com.moysport.service.TrainingplanService;

@Controller
public class TrainingplanController {
	
	@Autowired
	private TrainingplanService trainingplanService;

	@RequestMapping("/table_pages/trainingplan")
	public String listTrainingplan(Map<String, Object> map) {
		map.put("trainingplan", new Trainingplan());
		map.put("trainingplanList", trainingplanService.listTrainingplan());
		return "table_pages/trainingplan";
	}

	@RequestMapping(value = "/table_pages/trainingplan/add", method = RequestMethod.POST)
	public String addTrainingplan(@ModelAttribute("trainingplan") Trainingplan trainingplan, BindingResult result) {
		trainingplanService.addTrainingplan(trainingplan);
		return "redirect:/table_pages/trainingplan";
	}

	@RequestMapping(value = "/table_pages/trainingplan/delete", method = RequestMethod.POST)
	public String deleteTrainingplan(@RequestParam("idTP") Integer idTP) {
		trainingplanService.removeTrainingplan(idTP);
		return "redirect:/table_pages/trainingplan";
	}

}
