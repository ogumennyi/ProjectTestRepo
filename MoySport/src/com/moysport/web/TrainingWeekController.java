package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.TrainingWeek;
import com.moysport.service.TrainingWeekService;

@Controller
public class TrainingWeekController {
	
	@Autowired
	private TrainingWeekService trainingWeekService;

	@RequestMapping("/table_pages/trainingweek")
	public String listTrainingweek(Map<String, Object> map) {
		map.put("trainingweek", new TrainingWeek());
		map.put("trainingweekList", trainingWeekService.listTrainingweek());
		return "table_pages/trainingweek";
	}

	@RequestMapping(value = "/table_pages/trainingweek/add", method = RequestMethod.POST)
	public String addTrainingweek(@ModelAttribute("trainingweek") TrainingWeek trainingweek, BindingResult result) {
		trainingWeekService.addTrainingweek(trainingweek);
		return "redirect:/table_pages/trainingweek";
	}

	@RequestMapping(value = "/table_pages/trainingweek/delete", method = RequestMethod.POST)
	public String deleteTrainingweek(@RequestParam("idtw") Integer idtw) {
		trainingWeekService.removeTrainingweek(idtw);
		return "redirect:/table_pages/trainingweek";
	}

}
