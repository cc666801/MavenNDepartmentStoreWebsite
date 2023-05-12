package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.orderSystem;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order_status")
public class OrderStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_status_id")
	private Integer orderStatusId;
	
	@Column(name="order_status_name", columnDefinition = "nvarchar(200)")
	private String orderStatusName;
	
	
	
	// Constructor
	public OrderStatus() {
	}
	
	



	public OrderStatus(Integer orderStatusId, String orderStatusName) {
		super();
		this.orderStatusId = orderStatusId;
		this.orderStatusName = orderStatusName;
	}





	public Integer getOrderStatusId() {
		return orderStatusId;
	}



	public void setOrderStatusId(Integer orderStatusId) {
		this.orderStatusId = orderStatusId;
	}



	public String getOrderStatusName() {
		return orderStatusName;
	}



	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}
	
	

	

}
