package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.memberSystem.Member;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto.OrderDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.MemberService;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.OrderService;

@RestController
@RequestMapping("/api/order")
public class OrderControllerApi {
	
	@Autowired
	public OrderService orderService;
	
	@Autowired
	public MemberService memberService;
	
	// CREATE shoppingCart and shoppingCartCommodity
    @PostMapping("")
    public void createOrder(@RequestBody OrderDto orderDto) {
    	System.out.println(orderDto);
    	orderService.saveCashOnDeliverOrderByDto(orderDto);
    }
    
    @GetMapping("/cashOnDeliverOrder/{memberId}")
    public List<OrderDto> findAllCashOnDeliverOrderDtoByMemberId(@PathVariable Integer memberId) {
    	List<Order> orders = orderService.findAllCashOnDeliverOrderDtoByMemberId(memberId);
    	List<OrderDto> orderDtos = orders.stream()
    	        .map(OrderDto::new)
    	        .collect(Collectors.toList());
    	return orderDtos;
    }
    
    @GetMapping("/paymentFlowOrder/{memberId}")
    public List<OrderDto> findAllPaymentFlowOrderDtoByMemberId(@PathVariable Integer memberId) {
    	List<Order> orders = orderService.findAllPaymentFlowOrderDtoByMemberId(memberId);
    	List<OrderDto> orderDtos = orders.stream()
    	        .map(OrderDto::new)
    	        .collect(Collectors.toList());
    	return orderDtos;
    }
    
    @GetMapping("/cancelledOrder/{memberId}")
    public List<OrderDto> findAllCancelOrderByMemberId(@PathVariable Integer memberId) {
    	List<Order> orders = orderService.findAllCancelOrderByMemberId(memberId);
    	List<OrderDto> orderDtos = orders.stream()
    	        .map(OrderDto::new)
    	        .collect(Collectors.toList());
    	return orderDtos;
    }
    
    @PutMapping("/{memberId}/{orderId}")
    public List<OrderDto> changeOrderStatusByOrderId(@PathVariable Integer orderId, @PathVariable Integer memberId) {
    	List<Order> orders = orderService.changeOrderStatusByOrderId(orderId, memberId);
    	List<OrderDto> orderDtos = orders.stream()
    	        .map(OrderDto::new)
    	        .collect(Collectors.toList());
    	return orderDtos;
    }
    
    // For paymentFlow
    @PostMapping("/ecpayCheckout")
	public String ecpayCheckout(@RequestBody OrderDto orderDto, HttpSession session) {
    	Order order = orderService.savePaymentFlowOrderByDto(orderDto);
		Member member = (Member) session.getAttribute("member");
		System.out.println("==========登入前"+member.getName());
//	    if(member != null) {
//	        Member updatedMember = memberService.findMemberById(member.getId());
//	        session.setAttribute("member", updatedMember);
//	    }
		
	    String aioCheckOutALLForm = orderService.ecpayCheckout(order);
		return aioCheckOutALLForm;
	}

}
