package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartCommodityDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ShoppingCartCommodityService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.ShoppingCartService;

@RestController
@RequestMapping("/api/shoppingCart")
public class ShoppingCartControllerApi {
	
	 @Autowired
	 private ShoppingCartService shoppingCartService;
	 
	 @Autowired
	 private ShoppingCartCommodityService shoppingCartCommodityService;
	 
	 
	// CREATE shoppingCart and shoppingCartCommodity
    @PostMapping("")
    public void createShoppingCart(@RequestBody ShoppingCartDto shoppingCartDto) {
        shoppingCartService.saveShoppingCartByDto(shoppingCartDto);
    }
    
    @GetMapping("/{memberId}")
    public List<ShoppingCartCommodityDto> findAllShoppingCartCommodityByMemberId(@PathVariable Integer memberId) {
    	List<ShoppingCartCommodity> shoppingCartCommodities = shoppingCartCommodityService.findByMemberId(memberId);
    	List<ShoppingCartCommodityDto> shoppingCartCommodityDtos = shoppingCartCommodities.stream()
    	        .map(ShoppingCartCommodityDto::new)
    	        .collect(Collectors.toList());
    	
    	return shoppingCartCommodityDtos;
    }
    
    @PutMapping("/{memberId}/{commodityId}/{quantity}")
    public List<ShoppingCartCommodityDto> updateShoppingCartCommodityByMemberIdAndCommodityId(
    					@PathVariable Integer memberId,
    					@PathVariable Integer commodityId,
    					@PathVariable Integer quantity
    					) {
    	List<ShoppingCartCommodity> shoppingCartCommodities = shoppingCartCommodityService.updateShoppingCartCommodityByMemberIdAndCommodityId(memberId, commodityId, quantity);
    	List<ShoppingCartCommodityDto> shoppingCartCommodityDtos = shoppingCartCommodities.stream()
    	        .map(ShoppingCartCommodityDto::new)
    	        .collect(Collectors.toList());
    	
    	
    	return shoppingCartCommodityDtos;
    }
    
}
