package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.CuisineType;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant.RestaurantInformation;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CuisineTypeService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.RestaurantInformationService;

@Controller
public class RestaurantInformationController {
	@Autowired
	private RestaurantInformationService restInformationService;
	
	@Autowired
	private CuisineTypeService cuisineTypeService;
	
	@GetMapping("/restaurantInformation")
	public String showAllRestInformation(Model model) {

		List<RestaurantInformation> findAllRestInformation = restInformationService.findAllRestInformation();
		model.addAttribute("restInformation",findAllRestInformation);
		return "restaurant/showAllRestInformation";
	}
	
	@GetMapping("/restaurantInformation/add")
	public String addRestInformationPage(Model model) {
		model.addAttribute("RestInformation", new RestaurantInformation());
		
		List<Company> findAllRestaurants = restInformationService.findCompanyNoCuisineType();
		model.addAttribute("AllRestaurants", findAllRestaurants);
		
		List<CuisineType> findAllCuisineType = cuisineTypeService.findAllCuisineType();
		model.addAttribute("CuisineType", findAllCuisineType);
			
		return "restaurant/addRestInformation";
	}
	
	@PostMapping("/restaurantInformation/post")
	public String postRestInformation(@ModelAttribute("RestInformation") RestaurantInformation rest, Model model) {
		String companyexist = restInformationService.addRestaurantInformation(rest);
		model.addAttribute("companyexist",companyexist);
		
		model.addAttribute("RestInformation", new RestaurantInformation());
		
		List<Company> findAllRestaurants = restInformationService.findAllRestaurants();
		model.addAttribute("AllRestaurants", findAllRestaurants);
		
		List<CuisineType> findAllCuisineType = cuisineTypeService.findAllCuisineType();
		model.addAttribute("CuisineType", findAllCuisineType);
			
		return "restaurant/addRestInformation";
	}
	
	
	
}
