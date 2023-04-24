package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {

	@GetMapping("/Store/Storeindex")
	public String getstore(){
		return "Store/Storeindex";
	}

}
