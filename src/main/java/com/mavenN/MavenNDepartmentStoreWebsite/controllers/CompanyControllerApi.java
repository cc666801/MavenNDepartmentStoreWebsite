package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Dto.CompanyDto;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyService;

@RestController
@RequestMapping("/api/company")
public class CompanyControllerApi {
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/findAllPages")
	public Page<CompanyDto> showAllCompaniesApi(@RequestParam(name = "page", defaultValue = "1") Integer pageNumber) {
		Page<CompanyDto> page = companyService.findByPageApi(pageNumber);
		
	    return page;
	}
	
	@DeleteMapping("/deleteCompany/{id}")
	public Page<CompanyDto> deleteCompany(@PathVariable Integer id, @RequestParam(name = "page", defaultValue = "1") Integer pageNumber) {
		companyService.deleteCompanyById(id);
		Page<CompanyDto> page = companyService.findByPageApi(pageNumber);
		return page;
	}
}
