package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.util.HashSet;
import java.util.Set;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;

public class CooperationStatusDto {

	private Integer cooperationStatusId;
	private String cooperationStatusName;
	private Set<CompanyDto> set = new HashSet<>();

	public CooperationStatusDto() {
	}

	public CooperationStatusDto(CooperationStatus cooperationStatus) {
		this.cooperationStatusId = cooperationStatus.getCooperationStatusId();
		this.cooperationStatusName = cooperationStatus.getCooperationStatusName();
		Set<CompanyDto> companyDtoSet = new HashSet<>();
        for (Company company : cooperationStatus.getSet()) {
            companyDtoSet.add(new CompanyDto(company));
        }
        this.set = companyDtoSet;
	}

	public Integer getCooperationStatusId() {
		return cooperationStatusId;
	}

	public void setCooperationStatusId(Integer cooperationStatusId) {
		this.cooperationStatusId = cooperationStatusId;
	}

	public String getCooperationStatusName() {
		return cooperationStatusName;
	}

	public void setCooperationStatusName(String cooperationStatusName) {
		this.cooperationStatusName = cooperationStatusName;
	}

	public Set<CompanyDto> getSet() {
		return set;
	}

	public void setSet(Set<CompanyDto> set) {
		this.set = set;
	}

}
