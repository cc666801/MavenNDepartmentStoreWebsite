package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem;

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
@Table(name="industry_category")
public class IndustryCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="industry_category_id")
	private Integer industryCategoryId;
	
	@Column(name="industry_category_name", columnDefinition = "nvarchar(200)")
	private String industryCategoryName;
	
	@OneToMany(mappedBy = "industryCategory", cascade = CascadeType.ALL)
	Set<Company> set = new HashSet<>();
	
	// Constructor
	public IndustryCategory() {
	}

	// Getter and Setter
	public Integer getIndustryCategoryId() {
		return industryCategoryId;
	}

	public void setIndustryCategoryId(Integer industryCategoryId) {
		this.industryCategoryId = industryCategoryId;
	}

	public String getIndustryCategoryName() {
		return industryCategoryName;
	}

	public void setIndustryCategoryName(String industryCategoryName) {
		this.industryCategoryName = industryCategoryName;
	}

	public Set<Company> getSet() {
		return set;
	}

	public void setSet(Set<Company> set) {
		this.set = set;
	}
}
