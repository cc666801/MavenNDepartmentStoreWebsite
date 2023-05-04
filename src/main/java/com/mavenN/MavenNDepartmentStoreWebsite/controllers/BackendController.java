package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BackendController {
	
	@GetMapping(value = {"/exampleBackendPage"})
	public String getExamplePage(){
		return "example/exampleBackendPage";
	}
}
