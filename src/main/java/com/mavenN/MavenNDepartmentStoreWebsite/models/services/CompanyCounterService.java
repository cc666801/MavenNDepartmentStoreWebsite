package com.mavenN.MavenNDepartmentStoreWebsite.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CompanyRepository;
import com.mavenN.MavenNDepartmentStoreWebsite.models.repositorys.companySystem.CounterRepository;

@Controller
public class CompanyCounterService {

	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private CounterRepository counterRepository;
	
	// For addCompanyCounter()
	public List<Company> findAllCompanies() {
		List<Company> companies = companyRepository.findAll();
		return companies;
	}

}
