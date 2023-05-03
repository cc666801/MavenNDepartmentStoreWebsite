package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ShoppingCartCommodityId implements Serializable {
    
    private static final long serialVersionUID = 1L;

    @Column(name = "fk_commodity_id")
    private Integer commodityId;
    
    @Column(name = "fk_shopping_cart_id")
    private Integer shoppingCartId;



    // 构造函数、getter 和 setter 方法
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
    
    public Integer getCommodityId() {
		return commodityId;
	}


	public void setCommodityId(Integer commodityId) {
		this.commodityId = commodityId;
	}


	public Integer getShoppingCartId() {
		return shoppingCartId;
	}


	public void setShoppingCartId(Integer shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}


	// 注意需要实现 equals() 和 hashCode() 方法
	@Override
	public int hashCode() {
		return Objects.hash(commodityId, shoppingCartId);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingCartCommodityId other = (ShoppingCartCommodityId) obj;
		return Objects.equals(commodityId, other.commodityId) && Objects.equals(shoppingCartId, other.shoppingCartId);
	}

}