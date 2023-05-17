package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Coupon;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.Order;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;

public class OrderDto {
	
    private Integer orderId;
	
    private Integer memberId;
	
    private List<OrderDetailDto> orderDetailDtos;
	
	private Integer couponId;
	
	private Integer total;
	
	private Date createOrderTime;
	
	private String orderAddress;
	
	
	

	public OrderDto(Integer orderId, Integer memberId, List<OrderDetailDto> orderDetailDtos, Integer couponId, Integer total) {
		super();
		this.orderId = orderId;
		this.memberId = memberId;
		this.orderDetailDtos = orderDetailDtos;
		this.couponId = couponId;
		this.total = total;
	}
	
	public OrderDto(Order order) {
		this.orderId=order.getOrderId();
		this.memberId=order.getMember().getId();
		Coupon coupon = order.getCoupon();
	    this.couponId = (coupon != null) ? coupon.getCouponId() : null;
		List<OrderDetail> orderDetails = order.getOrderDetails();
		List<OrderDetailDto> orderDetailDtos = orderDetails.stream()
    	        .map(OrderDetailDto::new)
    	        .collect(Collectors.toList());
		this.orderDetailDtos = orderDetailDtos;
		this.total = order.getTotal();
		this.createOrderTime = order.getCreateOrderTime();
		String orderAddress = order.getOrderAddress();
		if (orderAddress != null) {
		  this.orderAddress = orderAddress;
		} else {
		  this.orderAddress = ""; // 或者您可以将其设置为其他默认值
		}
		
	}


	public OrderDto() {
		super();
	}


	public Integer getOrderId() {
		return orderId;
	}


	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
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


	public Integer getCouponId() {
		return couponId;
	}


	public void setCouponId(Integer couponId) {
		this.couponId = couponId;
	}
	
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}


}
