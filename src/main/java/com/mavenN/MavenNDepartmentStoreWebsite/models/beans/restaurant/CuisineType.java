package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cuisineType")
public class CuisineType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cuisineTypeId;
	
	@Column(columnDefinition = "nvarchar(50) NOT NULL")
	private String cuisineTypeName;

	public CuisineType() {
		super();
	}

	public Integer getCuisineTypeId() {
		return cuisineTypeId;
	}

	public void setCuisineTypeId(Integer cuisineTypeId) {
		this.cuisineTypeId = cuisineTypeId;
	}

	public String getCuisineTypeName() {
		return cuisineTypeName;
	}

	public void setCuisineTypeName(String cuisineTypeName) {
		this.cuisineTypeName = cuisineTypeName;
	}

	
	
	
	
}
