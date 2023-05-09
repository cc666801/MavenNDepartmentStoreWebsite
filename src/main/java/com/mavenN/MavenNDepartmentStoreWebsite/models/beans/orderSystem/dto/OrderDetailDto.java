package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;

public class OrderDetailDto {
	
    private Integer commodityId;
    
    private Integer orderId;
	    
    private Integer quantity;

    private Integer commodityPrice;
    
    private String commodityName;
    
	public OrderDetailDto(Integer commodityId, Integer orderId, Integer quantity) {
		super();
		this.commodityId = commodityId;
		this.orderId = orderId;
		this.quantity = quantity;
	}

	public OrderDetailDto() {
		super();
	}

	public OrderDetailDto(OrderDetail orderDetail) {
		this.commodityId = orderDetail.getCommodity().getCommId();
		this.orderId = orderDetail.getOrder().getOrderId();
		this.quantity = orderDetail.getQuantity();
		this.commodityPrice = orderDetail.getCommodityPrice();
		this.commodityName = orderDetail.getCommodity().getCommName();
	}
	

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public Integer getOrderId() {
		return orderId;
	}
	
	

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(Integer commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	@Override
	public String toString() {
		return "OrderDetailDto [commodityId=" + commodityId + ", orderId=" + orderId + ", quantity=" + quantity
				+ ", commodityPrice=" + commodityPrice + ", commodityName=" + commodityName + "]";
	}
    
	
}
