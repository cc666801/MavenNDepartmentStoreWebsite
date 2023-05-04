package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ShoppingCartService;

@RestController
@RequestMapping("/api/shoppingCart")
public class ShoppingCartControllerApi {
	
	 @Autowired
	 private ShoppingCartService shoppingCartService;
	 
	// CREATE a shopping cart
    @PostMapping("")
    public void createShoppingCart(@RequestBody ShoppingCartDto shoppingCartDto) {
        shoppingCartService.saveShoppingCartByDto(shoppingCartDto);
    }
}
