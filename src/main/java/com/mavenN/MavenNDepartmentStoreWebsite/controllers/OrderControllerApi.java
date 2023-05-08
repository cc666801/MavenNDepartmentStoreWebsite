package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.OrderService;

@RestController
@RequestMapping("/api/order")
public class OrderControllerApi {
	
	@Autowired
	public OrderService orderService;

	// CREATE shoppingCart and shoppingCartCommodity
    @PostMapping("")
    public void createOrder(@RequestBody OrderDto orderDto) {
    	System.out.println(orderDto);
    	orderService.saveOrderByDto(orderDto);
    }

}
