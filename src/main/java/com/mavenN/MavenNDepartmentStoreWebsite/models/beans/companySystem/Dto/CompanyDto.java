package com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto;

import java.util.Base64;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;

public class CompanyDto {

	private Integer companyId;
	private String companyName;
	private String companyPhone;
	private String base64StringCompanyLogo;
	private String addressName;
	private String industryCategoryName;
	private String openingHoursName;
	private String cooperationStatusName;
//	private List<Integer> counterIds;

	public CompanyDto() {
		super();
	}

//	public CompanyDto(Integer companyId, String companyName, String companyPhone, String base64StringCompanyLogo,
//			AddressDto address, IndustryCategoryDto industryCategory, OpeningHoursDto openingHours,
//			CooperationStatusDto cooperationStatus, List<Integer> counterIds) {
//		this.companyId = companyId;
//		this.companyName = companyName;
//		this.companyPhone = companyPhone;
//		this.base64StringCompanyLogo = base64StringCompanyLogo;
//		this.address = address;
//		this.industryCategory = industryCategory;
//		this.openingHours = openingHours;
//		this.cooperationStatus = cooperationStatus;
//		this.counterIds = counterIds;
//	}

	public CompanyDto(Company company) {
		this.companyId = company.getCompanyId();
		this.companyName = company.getCompanyName();
		this.companyPhone = company.getCompanyPhone();
		
		String base64CompanyLogo = Base64.getEncoder().encodeToString(company.getCompanyLogo());

		this.base64StringCompanyLogo = base64CompanyLogo;
		this.addressName = company.getAddress().getAddressName();
		this.industryCategoryName = company.getIndustryCategory().getIndustryCategoryName();
		this.openingHoursName = company.getOpeningHours().getOpeningHoursName();
		this.cooperationStatusName = company.getCooperationStatus().getCooperationStatusName();
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getBase64StringCompanyLogo() {
		return base64StringCompanyLogo;
	}

	public void setBase64StringCompanyLogo(String base64StringCompanyLogo) {
		this.base64StringCompanyLogo = base64StringCompanyLogo;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getIndustryCategoryName() {
		return industryCategoryName;
	}

	public void setIndustryCategoryName(String industryCategoryName) {
		this.industryCategoryName = industryCategoryName;
	}

	public String getOpeningHoursName() {
		return openingHoursName;
	}

	public void setOpeningHoursName(String openingHoursName) {
		this.openingHoursName = openingHoursName;
	}

	public String getCooperationStatusName() {
		return cooperationStatusName;
	}

	public void setCooperationStatusName(String cooperationStatusName) {
		this.cooperationStatusName = cooperationStatusName;
	}

//	public List<Integer> getCounterIds() {
//		return counterIds;
//	}
//
//	public void setCounterIds(List<Integer> counterIds) {
//		this.counterIds = counterIds;
//	}

}
