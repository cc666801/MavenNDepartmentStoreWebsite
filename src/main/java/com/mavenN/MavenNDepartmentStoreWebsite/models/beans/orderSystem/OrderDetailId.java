package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class OrderDetailId implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "fk_commodity_id")
    private Integer commodityId;
    
    @Column(name = "fk_order_id")
    private Integer orderId;

    
	public OrderDetailId(Integer commodityId, Integer orderId) {
		super();
		this.commodityId = commodityId;
		this.orderId = orderId;
	}

	public OrderDetailId() {
		super();
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

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderDetailId [commodityId=" + commodityId + ", orderId=" + orderId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(commodityId, orderId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailId other = (OrderDetailId) obj;
		return Objects.equals(commodityId, other.commodityId) && Objects.equals(orderId, other.orderId);
	}
    
}
