package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {

	@GetMapping(value = {"/"})
	public String getHomePage(){
		return "index";
	}
}
