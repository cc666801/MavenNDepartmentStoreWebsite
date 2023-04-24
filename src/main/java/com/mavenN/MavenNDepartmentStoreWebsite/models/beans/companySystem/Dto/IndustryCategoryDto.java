package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.util.HashSet;
import java.util.Set;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.IndustryCategory;

public class IndustryCategoryDto {

	private Integer industryCategoryId;
	
	private String industryCategoryName;
	
	private Set<CompanyDto> companies = new HashSet<>();

	// Constructor with fields
	public IndustryCategoryDto(IndustryCategory industryCategory) {
		this.industryCategoryId = industryCategory.getIndustryCategoryId();
		this.industryCategoryName = industryCategory.getIndustryCategoryName();
		Set<CompanyDto> companyDtoSet = new HashSet<>();
        for (Company company : industryCategory.getSet()) {
            companyDtoSet.add(new CompanyDto(company));
        }
        this.companies = companyDtoSet;
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

	public Set<CompanyDto> getCompanies() {
		return companies;
	}

	public void setCompanies(Set<CompanyDto> companies) {
		this.companies = companies;
	}

}