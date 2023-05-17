package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import java.util.Base64;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.OrderDetail;

public class OrderDetailDto {
	
    private Integer commodityId;
    
    private Integer orderId;
	    
    private Integer quantity;

    private Integer commodityPrice;
    
    private String commodityName;
    
    private String base64CommodityPictureString;
    
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
		this.base64CommodityPictureString = Base64.getEncoder().encodeToString(orderDetail.getCommodity().getCommPicture());
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
	
	

	public String getBase64CommodityPictureString() {
		return base64CommodityPictureString;
	}

	public void setBase64CommodityPictureString(String base64CommodityPictureString) {
		this.base64CommodityPictureString = base64CommodityPictureString;
	}

	@Override
	public String toString() {
		return "OrderDetailDto [commodityId=" + commodityId + ", orderId=" + orderId + ", quantity=" + quantity
				+ ", commodityPrice=" + commodityPrice + ", commodityName=" + commodityName + "]";
	}
    
	
}
