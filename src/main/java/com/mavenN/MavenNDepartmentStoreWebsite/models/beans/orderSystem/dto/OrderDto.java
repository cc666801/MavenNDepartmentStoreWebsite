package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;

public class OrderDto {
	
    private Integer orderId;
	
    private Integer memberId;
	
    private List<OrderDetailDto> orderDetailDtos;
	
	private String couponCode;
	
	private Integer total;
	
	private Date createOrderTime;
	

	public OrderDto(Integer orderId, Integer memberId, List<OrderDetailDto> orderDetailDtos, String couponCode, Integer total) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.orderDetailDtos = orderDetailDtos;
		this.couponCode = couponCode;
		this.total = total;
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
		this.total = order.getTotal();
		this.createOrderTime = order.getCreateOrderTime();
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
	
	


	public Date getCreateOrderTime() {
		return createOrderTime;
	}

	public void setCreateOrderTime(Date createOrderTime) {
		this.createOrderTime = createOrderTime;
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
	
	


	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrderDto [orderId=" + orderId + ", memberId=" + memberId + ", orderDetailDtos=" + orderDetailDtos
				+ ", couponCode=" + couponCode + ", total=" + total + "]";
	}

	

	
}
