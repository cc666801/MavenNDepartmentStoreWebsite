package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MessageController {
	
	@GetMapping(value = {"/message/add"})
	public String getHomePage(){
		return "message/addMessagePage";
	}
	

}
