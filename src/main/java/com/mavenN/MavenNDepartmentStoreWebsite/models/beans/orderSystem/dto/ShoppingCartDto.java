package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem.dto;

public class ShoppingCartDto {

	private Integer shoppingCartId;
	
	private Integer commodityId;
	
	private String commodityName;
	
	private Integer memberId;
	
	private Integer quantity;
	
	public ShoppingCartDto() {
	}

	public Integer getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public Integer getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(Integer shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	@Override
	public String toString() {
		return "ShoppingCartDto [shoppingCartId=" + shoppingCartId + ", commodityId=" + commodityId + ", commodityName="
				+ commodityName + ", memberId=" + memberId + ", quantity=" + quantity + "]";
	}
	
}
