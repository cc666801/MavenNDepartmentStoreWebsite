package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Commodity;

@Entity
@Table(name = "order_detail_table")
public class OrderDetail {
	
	@EmbeddedId
	private OrderDetailId id;
	    
    @Column(name = "quantity")
    private Integer quantity;
    
    @Column(name = "price")
    private Integer commodityPrice;

    @ManyToOne
    @MapsId("commodityId")
    @JoinColumn(name = "fk_commodity_id")
    private Commodity commodity;

    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "fk_order_id")
    private Order order;

	

	public OrderDetail(OrderDetailId id, Integer quantity, Integer commodityPrice, Commodity commodity, Order order) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.commodityPrice = commodityPrice;
		this.commodity = commodity;
		this.order = order;
	}

	public OrderDetail() {
		super();
	}

	public OrderDetailId getId() {
		return id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	

	public Integer getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(Integer commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", quantity=" + quantity + ", commodityPrice=" + commodityPrice
				+ ", commodity=" + commodity + ", order=" + order + "]";
	}

	
    
    
}
