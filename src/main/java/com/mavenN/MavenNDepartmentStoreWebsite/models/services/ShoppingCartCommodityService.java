package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartCommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

public class ShoppingCartCommodityService {

	@Autowired
	private ShoppingCartRepository shoppingCartRepository;
	
	@Autowired
	private ShoppingCartCommodityRepository shoppingCartCommodityRepository;
	
	// Api
	// For saveShoppingCartCommodity()
	public void saveShoppingCartCommodity(ShoppingCartCommodity shoppingCartCommodity) {
		shoppingCartCommodityRepository.save(shoppingCartCommodity);
	}
	
	
}
