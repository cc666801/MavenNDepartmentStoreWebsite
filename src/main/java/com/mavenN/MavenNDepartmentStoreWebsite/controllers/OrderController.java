package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

	@GetMapping(value = {"/orderSystem/order"})
	public String getOrderStatus(){
		return "orderSystem/orderStatus";
	}

}
