package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartCommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

@Service
public class ShoppingCartCommodityService {

	@Autowired
	private ShoppingCartRepository shoppingCartRepository;
	
	@Autowired
	private ShoppingCartCommodityRepository shoppingCartCommodityRepository;
	
	// Api
	// For findAllShoppingCartCommodityByMemberId()
	public List<ShoppingCartCommodity> findByMemberId(Integer memberId){
		return shoppingCartCommodityRepository.findByMemberId(memberId);
	}
	
}
