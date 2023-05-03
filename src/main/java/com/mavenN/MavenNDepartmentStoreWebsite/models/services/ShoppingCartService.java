package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartCommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

public class ShoppingCartService {

	@Autowired
	private ShoppingCartRepository shoppingCartRepository;
	
	@Autowired
	private ShoppingCartCommodityRepository shoppingCartCommodityRepository;
	
	// Api
	// For saveShoppingCart()
	public void saveShoppingCart(ShoppingCart shoppingCart) {
		shoppingCartRepository.save(shoppingCart);
	}
	
	
}
