
package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.Training;
import com.moysport.service.TrainingService;

@Controller
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;

	@RequestMapping("/table_pages/trainings")
	public String listTrainings(Map<String, Object> map) {
		map.put("trainings", new Training());
		map.put("trainingsList", trainingService.listTrainings());
		return "table_pages/trainings";
	}

	@RequestMapping(value = "/table_pages/trainings/add", method = RequestMethod.POST)
	public String addTrainings(@ModelAttribute("trainings") Training trainings, BindingResult result) {
		trainingService.addTrainings(trainings);
		return "redirect:/table_pages/trainings";
	}

	@RequestMapping(value = "/table_pages/trainings/delete", method = RequestMethod.POST)
	public String deleteTrainings(@RequestParam("idt") Integer idt) {
		trainingService.removeTrainings(idt);
		return "redirect:/table_pages/trainings";
	}

}
