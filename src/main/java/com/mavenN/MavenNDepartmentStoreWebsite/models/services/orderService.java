package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import javax.transaction.Transactional;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.ShoppingCartDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderDetailRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.orderSystem.OrderRepository;

public class orderService {

	public OrderRepository orderRepository;
	
	public OrderDetailRepository orderDetailRepository;
	
	// Api
		// For saveShoppingCart()
		@Transactional
		public void saveOrderByDto(OrderDto orderDto) {
		    Integer memberId = orderDto.getMemberId();
		    
		}

}
