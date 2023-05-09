package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
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
    	orderService.saveOrderByDto(orderDto);
    }
    
    @GetMapping("/{memberId}")
    public List<OrderDto> findAllOrderDtoByMemberId(@PathVariable Integer memberId) {
    	List<Order> orders = orderService.findByMemberId(memberId);
    	List<OrderDto> orderDtos = orders.stream()
    	        .map(OrderDto::new)
    	        .collect(Collectors.toList());
    	System.out.println(orderDtos);
    	return null;
    }

}
