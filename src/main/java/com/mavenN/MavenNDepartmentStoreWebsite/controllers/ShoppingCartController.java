package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShoppingCartController {
	
	@GetMapping(value = {"/orderSystem/shoppingCart"})
	public String getShoppingCartStatus(){
		return "orderSystem/shoppingCartStatus";
	}
}
