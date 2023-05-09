package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="restaurant_Information")
public class cuisine {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cuisineid;
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String cuisineType;

	
	
	public Integer getCuisineid() {
		return cuisineid;
	}

	public void setCuisineid(Integer cuisineid) {
		this.cuisineid = cuisineid;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}
	
	
	
	
}
