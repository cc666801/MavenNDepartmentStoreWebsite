package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import java.util.List;
import java.util.stream.Collectors;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;

public class OrderDto {
	
    private Integer orderId;
	
    private Integer memberId;
	
    private List<OrderDetailDto> orderDetailDtos;
	
	private String couponCode;
	

	public OrderDto(Integer orderId, Integer memberId, List<OrderDetailDto> orderDetailDtos, String couponCode) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.orderDetailDtos = orderDetailDtos;
		this.couponCode = couponCode;
	}
	
	public OrderDto(Order order) {
		this.orderId=order.getOrderId();
		this.memberId=order.getMember().getId();
		this.couponCode=order.getCouponCode();
		List<OrderDetail> orderDetails = order.getOrderDetails();
		List<OrderDetailDto> orderDetailDtos = orderDetails.stream()
    	        .map(OrderDetailDto::new)
    	        .collect(Collectors.toList());
		this.orderDetailDtos = orderDetailDtos;
	}


	public OrderDto() {
		super();
	}


	public Integer getOrderId() {
		return orderId;
	}


	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public Integer getMemberId() {
		return memberId;
	}


	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}


	public List<OrderDetailDto> getOrderDetailDtos() {
		return orderDetailDtos;
	}


	public void setOrderDetailDtos(List<OrderDetailDto> orderDetailDtos) {
		this.orderDetailDtos = orderDetailDtos;
	}


	public String getCouponCode() {
		return couponCode;
	}


	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}


	@Override
	public String toString() {
		return "OrderDto [orderId=" + orderId + ", memberId=" + memberId + ", orderDetailDtos=" + orderDetailDtos
				+ ", couponCode=" + couponCode + "]";
	}

	
}
