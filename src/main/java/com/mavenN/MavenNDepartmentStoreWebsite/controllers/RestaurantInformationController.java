package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
//		List<Company> findRestaurants = restInformationService.findAllRestaurants();
//		model.addAttribute("restaurants",findRestaurants);
		
		List<RestaurantInformation> findAllRestInformation = restInformationService.findAllRestInformation();
		System.out.println("*********");
		System.out.println(findAllRestInformation);
		model.addAttribute("restInformation",findAllRestInformation);
		return "restaurant/showAllRestInformation";
	}
	
	
}
