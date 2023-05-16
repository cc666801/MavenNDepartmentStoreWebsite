package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CuisineTypeService;

@Controller
public class CuisineTypeController {
	
	@Autowired
	private CuisineTypeService cuisineTypeService;
	
	
	@GetMapping("/showAllCuisionType/editPage")
	public String editCuisiontypePage(@RequestParam("cuisineTypeId") Integer cuisineTypeId,Model model) {
		CuisineType findCusineTypeById = cuisineTypeService.findCusineTypeById(cuisineTypeId);
		model.addAttribute("thisCuisinetype", findCusineTypeById);
		return "restaurant/editCuisibeTypePage";
	}
	
	@PutMapping("/editCuisibeTypePage/edit") 
	public String editCuisiontype(@ModelAttribute("thisCuisinetype") CuisineType cusisine, Model model) {
		cuisineTypeService.updateCuisineTypeById(cusisine.getCuisineTypeId(), cusisine.getCuisineTypeName());
		return "redirect:/cuisiontype";
	}
	
	@DeleteMapping("/showAllCuisionType/delete")
	public String deleteCuision(@RequestParam("cuisineTypeId") Integer cuisineTypeId, Model model) {
		cuisineTypeService.deleteById(cuisineTypeId);
		return "redirect:/cuisiontype";
	}
	
	@GetMapping("/cuisiontype")
	public String showAllCuisiontype(Model model){
		List<CuisineType> findAllCuisineType = cuisineTypeService.findAllCuisineType();
		model.addAttribute("findAllCuisineType", findAllCuisineType);
		return "restaurant/showAllCuisineType";
	}
	
	@GetMapping("/cuisiontype/add")
	public String addCuisiontype(Model model) {
		model.addAttribute("cuisinetype", new CuisineType());
		return "restaurant/addCuisibeType";
	}
	
	@PostMapping("/cuisiontype/post")
	public String postCuisiontype(@ModelAttribute("cuisinetype") CuisineType cuisinetype, Model model) {
		cuisineTypeService.addCuisineType(cuisinetype);
		return "redirect:/cuisiontype/add";
	}
}
