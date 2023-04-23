package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.util.HashSet;
import java.util.Set;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.OpeningHours;

public class OpeningHoursDto {

	private Integer openingHoursId;
	
	private String openingHoursName;
	
	Set<CompanyDto> set = new HashSet<>();
	
	// Constructor
	public OpeningHoursDto() {
	}

	public OpeningHoursDto(Integer openingHoursId, String openingHoursName) {
		this.openingHoursId = openingHoursId;
		this.openingHoursName = openingHoursName;
	}
	
	public OpeningHoursDto(OpeningHours openingHours) {
        this.openingHoursId = openingHours.getOpeningHoursId();
        this.openingHoursName = openingHours.getOpeningHoursName();
        Set<CompanyDto> companyDtoSet = new HashSet<>();
        for (Company company : openingHours.getSet()) {
            companyDtoSet.add(new CompanyDto(company));
        }
        this.set = companyDtoSet;
    }

	// Getter and Setter
	public Integer getOpeningHoursId() {
		return openingHoursId;
	}

	public void setOpeningHoursId(Integer openingHoursId) {
		this.openingHoursId = openingHoursId;
	}

	public String getOpeningHoursName() {
		return openingHoursName;
	}

	public void setOpeningHoursName(String openingHoursName) {
		this.openingHoursName = openingHoursName;
	}

	public Set<CompanyDto> getSet() {
		return set;
	}

	public void setSet(Set<CompanyDto> set) {
		this.set = set;
	}
}
