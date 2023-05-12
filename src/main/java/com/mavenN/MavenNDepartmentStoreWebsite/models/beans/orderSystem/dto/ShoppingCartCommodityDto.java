package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

import java.util.Base64;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.ShoppingCartCommodity;

public class ShoppingCartCommodityDto {
	
	private Integer commodityId;
	
	private String commodityName;
	
	private Integer commodityPrice;
	
	private Double commodityDiscount;
	
	private Integer quantity;
	
	private String base64CommodityPictureString;
	
	

	public ShoppingCartCommodityDto() {
		super();
	}

	public ShoppingCartCommodityDto(ShoppingCartCommodity shoppingCartCommodity) {
		this.commodityId=shoppingCartCommodity.getCommodity().getCommId();
		this.commodityName = shoppingCartCommodity.getCommodity().getCommName();
		this.commodityPrice =Integer.valueOf(shoppingCartCommodity.getCommodity().getCommPrice().intValue());
		this.quantity = shoppingCartCommodity.getQuantity();
		this.commodityDiscount =Double.valueOf(shoppingCartCommodity.getCommodity().getCommDiscount());
		this.base64CommodityPictureString = Base64.getEncoder().encodeToString(shoppingCartCommodity.getCommodity().getCommPicture());
	}

	public ShoppingCartCommodityDto(String commodityName, Integer commodityPrice, Integer quantity,
			String base64CommodityPictureString) {
		super();
		this.commodityName = commodityName;
		this.commodityPrice = commodityPrice;
		this.quantity = quantity;
		this.base64CommodityPictureString = base64CommodityPictureString;
	}



	@Override
	public String toString() {
		return "ShoppingCartCommodityDto [commodityName=" + commodityName + ", commodityPrice=" + commodityPrice
				+ ", quantity=" + quantity + "]";
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public Integer getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(Integer commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}
	
	

	public Double getCommodityDiscount() {
		return commodityDiscount;
	}

	public void setCommodityDiscount(Double commodityDiscount) {
		this.commodityDiscount = commodityDiscount;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Integer getSubTotal() {
		return quantity*commodityPrice;
	}

	


	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public String getBase64CommodityPictureString() {
		return base64CommodityPictureString;
	}



	public void setBase64CommodityPictureString(String base64CommodityPictureString) {
		this.base64CommodityPictureString = base64CommodityPictureString;
	}
    
	
}