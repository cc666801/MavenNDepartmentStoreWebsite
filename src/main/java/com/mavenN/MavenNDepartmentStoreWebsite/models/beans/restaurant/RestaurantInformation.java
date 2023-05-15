package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

@Entity
@Table(name="restaurant_Information")
public class RestaurantInformation {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer resid;
	
	@OneToOne
	@JoinColumn(name="company_id",foreignKey = @ForeignKey(name="fk_company"))
	private Company company;
	
	@ManyToOne
	@JoinColumn(name="cuisineType_id", foreignKey = @ForeignKey(name="fk_cuisineType"))
	private CuisineType cuisineType;

	public RestaurantInformation() {
		super();
	}

	
	public Integer getResid() {
		return resid;
	}

	public void setResid(Integer resid) {
		this.resid = resid;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public CuisineType getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(CuisineType cuisineType) {
		this.cuisineType = cuisineType;
	}


	@Override
	public String toString() {
		return "RestaurantInformation [resid=" + resid + ", company=" + company + ", cuisineType=" + cuisineType + "]";
	}
	
	
	
	
	
	
	
}
