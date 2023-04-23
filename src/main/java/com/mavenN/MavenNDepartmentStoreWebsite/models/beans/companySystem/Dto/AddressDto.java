package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.util.HashSet;
import java.util.Set;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public class AddressDto {

	private Integer addressId;

	private String addressName;

	private Set<CompanyDto> set = new HashSet<>();

	// Constructor
	public AddressDto() {
	}

	public AddressDto(Address address) {

		this.addressId = address.getAddressId();
		this.addressName = address.getAddressName();
		Set<CompanyDto> companyDtoSet = new HashSet<>();
		for (Company company : address.getSet()) {
			companyDtoSet.add(new CompanyDto(company));
		}
		this.set = companyDtoSet;
	}

	// Getter and Setter
	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public Set<CompanyDto> getSet() {
		return set;
	}

	public void setSet(Set<CompanyDto> set) {
		this.set = set;
	}
}
