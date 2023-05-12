package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Date;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodityId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.memberSystem.MemberRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartCommodityRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.ShoppingCartRepository;

@Service
public class ShoppingCartService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private ShoppingCartRepository shoppingCartRepository;
	
	@Autowired
	private ShoppingCartCommodityRepository shoppingCartCommodityRepository;
	
	@Autowired
	private CommodityRepository commodityRepository;
	
	// Api
	// For saveShoppingCart()
	@Transactional
	public void saveShoppingCartByDto(ShoppingCartDto shoppingCartDto) {
	    Integer memberId = shoppingCartDto.getMemberId();
	    Integer quantity = shoppingCartDto.getQuantity();
	    Integer commodityId = shoppingCartDto.getCommodityId();

	    Optional<Member> memberOptional = memberRepository.findById(memberId);
	    if (memberOptional.isPresent()) {
	        // 如果会员存在，则查找对应 memberId 的购物车
	        Optional<ShoppingCart> shoppingCartOptional = shoppingCartRepository.findByMemberId(memberId);
	        if (shoppingCartOptional.isPresent()) {
	            // 如果购物车已存在，则更新购物车
	            ShoppingCart shoppingCart = shoppingCartOptional.get();
	            ShoppingCartCommodityId id = new ShoppingCartCommodityId(commodityId, shoppingCart.getShoppingCartId());
	            Optional<ShoppingCartCommodity> shoppingCartCommodityOptional = shoppingCartCommodityRepository.findById(id);
	            if (shoppingCartCommodityOptional.isPresent()) {
	                // 如果购物车中已经有该商品，则更新商品数量
	                ShoppingCartCommodity shoppingCartCommodity = shoppingCartCommodityOptional.get();
	                shoppingCartCommodity.setQuantity(quantity);
	                shoppingCartCommodityRepository.save(shoppingCartCommodity);
	            } else {
	                // 如果购物车中没有该商品，则新增购物车商品
	                Optional<Commodity> commodityOptional = commodityRepository.findById(commodityId);
	                if (commodityOptional.isPresent()) {
	                    Commodity commodity = commodityOptional.get();
	                    ShoppingCartCommodityId shoppingCartCommodityId = new ShoppingCartCommodityId(shoppingCart.getShoppingCartId(), commodity.getCommId());
	                    ShoppingCartCommodity newShoppingCartCommodity = new ShoppingCartCommodity(shoppingCartCommodityId, quantity, commodity, shoppingCart);
	                    shoppingCartCommodityRepository.save(newShoppingCartCommodity); // 先持久化 newShoppingCartCommodity 物件
	                    shoppingCart.getShoppingCartCommodities().add(newShoppingCartCommodity);
	                }
	            }
	            Date now = new Date();
	            long time = now.getTime() / 1000 * 1000;
	            Date truncatedNow = new Date(time);
	            shoppingCart.setLastUpdatedTime(truncatedNow);

	            shoppingCartRepository.save(shoppingCart);
	        } else {
	        	// 如果购物车不存在，则创建新的购物车
	        	ShoppingCart newShoppingCart = new ShoppingCart(null, memberOptional.get());
	        	newShoppingCart = shoppingCartRepository.save(newShoppingCart); // 保存新购物车并更新购物车ID
	        	Optional<Commodity> commodityOptional = commodityRepository.findById(commodityId);
	        	if (commodityOptional.isPresent()) {
	        	    Commodity commodity = commodityOptional.get();
	        	    ShoppingCartCommodityId shoppingCartCommodityId = new ShoppingCartCommodityId(commodity.getCommId(), newShoppingCart.getShoppingCartId());
	        	    ShoppingCartCommodity newShoppingCartCommodity = new ShoppingCartCommodity(shoppingCartCommodityId, quantity, commodity, newShoppingCart);
	        	    newShoppingCart.getShoppingCartCommodities().add(newShoppingCartCommodity);
	        	    shoppingCartCommodityRepository.save(newShoppingCartCommodity); // 保存新购物车商品
	        	}
	        }
	    }
	}
	
}
