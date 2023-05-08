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
@Table(name = "shopping_cart_commodity")
public class ShoppingCartCommodity {
    
	@EmbeddedId
	private ShoppingCartCommodityId id;
	    
    @Column(name = "quantity")
    private Integer quantity;

    @ManyToOne
    @MapsId("commodityId")
    @JoinColumn(name = "fk_commodity_id")
    private Commodity commodity;

    @ManyToOne
    @MapsId("shoppingCartId")
    @JoinColumn(name = "fk_shoppingCart_id")
    private ShoppingCart shoppingCart;

	public ShoppingCartCommodity() {
		super();
	}


	public ShoppingCartCommodity(ShoppingCartCommodityId id, Integer quantity, Commodity commodity,
			ShoppingCart shoppingCart) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.commodity = commodity;
		this.shoppingCart = shoppingCart;
	}


	@Override
	public String toString() {
		return "ShoppingCartCommodity [id=" + id + ", quantity=" + quantity + "]";
	}


	// getter and setter methods
	public ShoppingCartCommodityId getId() {
		return id;
	}


	public void setId(ShoppingCartCommodityId id) {
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


	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}


	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	
    
    
    
}