package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.IndustryCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.AddressRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CooperationStatusRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.IndustryCategoryRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.OpeningHoursRepository;

@Service
public class CompanyService {
	
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private AddressRepository addressRepository;
	@Autowired
	private IndustryCategoryRepository industryCategoryRepository;
	@Autowired
	private CooperationStatusRepository cooperationStatusRepository;
	@Autowired
	private OpeningHoursRepository openingHoursRepository;
	
	public void addCompany(Company company) {
		companyRepository.save(company);
	}
	
	public List<Address> findAllAddresses() {
		List<Address> addresses = addressRepository.findAll();
		return addresses;
	}
	
	public List<IndustryCategory> findAllIndustryCategorys() {
		List<IndustryCategory> industryCategories = industryCategoryRepository.findAll();
		return industryCategories;
	}
	
}
