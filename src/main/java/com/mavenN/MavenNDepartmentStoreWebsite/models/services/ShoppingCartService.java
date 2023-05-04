package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCart;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartDto;
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
	
	// Api
	// For saveShoppingCart()
	public void saveShoppingCartByDto(ShoppingCartDto shoppingCartDto) {
		
		Optional<Member> memberOptional = memberRepository.findById(shoppingCartDto.getMemberId());
		Member member = memberOptional.get();
		System.out.println(member);
		
		ShoppingCart shoppingCart = new ShoppingCart(null, member);
		shoppingCartRepository.save(shoppingCart);
	}
	
	
}
