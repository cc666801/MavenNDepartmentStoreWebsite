package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = {"/"})
	public String getHomePage(){
		return "index";
	}
	
	@GetMapping(value = {"/example"})
	public String getExamplePage(){
		return "example/exampleMessagePage";
	}
	
	@GetMapping(value = {"/company"})
	public String getCompanyPage(){
		return "company/companyHomePage";
	}
}
