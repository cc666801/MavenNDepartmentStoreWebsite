package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping(value = {"/"})
	public String getHomePage(){
		return "index";
	}
	
	@GetMapping(value = {"/message/example"})
	public String getExampleMessagePage(){
		return "message/exampleMessagePage";
	}
}
