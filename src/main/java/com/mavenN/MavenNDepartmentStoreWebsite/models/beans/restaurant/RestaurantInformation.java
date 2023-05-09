package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.restaurant;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

@Entity
@Table(name="restaurant_Information")
public class RestaurantInformation {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Resid;
	
	@OneToOne
	@JoinColumn(name="fk_company_id")
	private Company company;
	
//	@OneToOne
//	@JoinColumn(name="fk_cuisine_id")
//	private 
	
	
	
	
}
