package com.moysport.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.moysport.model.LocationSport;
import com.moysport.service.LocationSportService;

@Controller
public class LocationSportController {
	
	@Autowired
	private LocationSportService locationSportService;

	@RequestMapping("/table_pages/locationsport")
	public String listTrainingweek(Map<String, Object> map) {
		map.put("locationsport", new LocationSport());
		map.put("locationsportList", locationSportService.listLocationSport());
		return "table_pages/locationsport";
	}

	@RequestMapping(value = "/table_pages/locationsport/add", method = RequestMethod.POST)
	public String addTrainingweek(@ModelAttribute("locationsport") LocationSport locationsport, BindingResult result) {
		locationSportService.addLocationSport(locationsport);
		return "redirect:/table_pages/locationsport";
	}

	@RequestMapping(value = "/table_pages/locationsport/delete", method = RequestMethod.POST)
	public String deleteTrainingweek(@RequestParam("idls") Integer idls) {
		locationSportService.removeLocationSport(idls);
		return "redirect:/table_pages/locationsport";
	}

}
