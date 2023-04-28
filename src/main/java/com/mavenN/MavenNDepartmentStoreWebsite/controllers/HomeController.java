package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = {"/"})
	public String getHomePage(){
		return "frontend/index";
	}
	
	@GetMapping(value = {"/exampleFrontendPage"})
	public String getExamplePage(){
		return "example/exampleFrontendPage";
	}
	
	@GetMapping(value = {"/backend"})
	public String getBackendPage(){
		return "backend/index";
	}
	
	@GetMapping(value = {"/company/floor"})
	public String getCompanyPage(){
		return "company/floor";
	}
}
