package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodityId;
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
	
	// For updateShoppingCartCommodityByMemberIdAndCommodityId()
	public List<ShoppingCartCommodity> updateShoppingCartCommodityByMemberIdAndCommodityId(
			Integer memberId,
			Integer commodityId,
			Integer quantity){
		Optional<ShoppingCart> optionalShoppingCart = shoppingCartRepository.findByMemberId(memberId);
		if(optionalShoppingCart.isPresent()) {
			ShoppingCart shoppingCart = optionalShoppingCart.get();
			ShoppingCartCommodityId id = new ShoppingCartCommodityId(commodityId, shoppingCart.getShoppingCartId());
			Optional<ShoppingCartCommodity> optionalShoppingCartCommodity = shoppingCartCommodityRepository.findById(id);
			if(optionalShoppingCartCommodity.isPresent()) {
				ShoppingCartCommodity shoppingCartCommodity = optionalShoppingCartCommodity.get();
				shoppingCartCommodity.setQuantity(quantity);
				shoppingCartCommodityRepository.save(shoppingCartCommodity);
				Date now = new Date();
	            long time = now.getTime() / 1000 * 1000;
	            Date truncatedNow = new Date(time);
	            shoppingCart.setLastUpdatedTime(truncatedNow);
	            shoppingCartRepository.save(shoppingCart);
	            
	            List<ShoppingCartCommodity> shoppingCartCommodities = shoppingCartCommodityRepository.findByMemberId(memberId);
	            return shoppingCartCommodities;
	            
			}
		}
		return null;
	}
}
