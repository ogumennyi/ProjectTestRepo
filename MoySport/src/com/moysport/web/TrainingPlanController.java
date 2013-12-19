package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.TrainingPlan;
import com.moysport.service.TrainingPlanService;

@Controller
public class TrainingPlanController {
	
	@Autowired
	private TrainingPlanService trainingPlanService;

	@RequestMapping("/table_pages/trainingplan")
	public String listTrainingplan(Map<String, Object> map) {
		map.put("trainingplan", new TrainingPlan());
		map.put("trainingplanList", trainingPlanService.listTrainingplan());
		return "table_pages/trainingplan";
	}

	@RequestMapping(value = "/table_pages/trainingplan/add", method = RequestMethod.POST)
	public String addTrainingplan(@ModelAttribute("trainingplan") TrainingPlan trainingplan, BindingResult result) {
		trainingPlanService.addTrainingplan(trainingplan);
		return "redirect:/table_pages/trainingplan";
	}

	@RequestMapping(value = "/table_pages/trainingplan/delete", method = RequestMethod.POST)
	public String deleteTrainingplan(@RequestParam("idTP") Integer idTP) {
		trainingPlanService.removeTrainingplan(idTP);
		return "redirect:/table_pages/trainingplan";
	}

}
