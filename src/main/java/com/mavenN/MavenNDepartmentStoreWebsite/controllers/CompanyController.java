package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Address;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.IndustryCategory;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.OpeningHours;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping(value = { "/company/addCompany" })
	public String getAddCompanyPage(Model model) {
		model.addAttribute("company", new Company());
		
		List<Address> addresses = companyService.findAllAddresses();
		model.addAttribute("addresses", addresses);
		
		List<IndustryCategory> industryCategories = companyService.findAllIndustryCategorys();
		model.addAttribute("industryCategories", industryCategories);
		
		List<CooperationStatus> cooperationStatuses = companyService.findAllCooperationStatuses();
		model.addAttribute("cooperationStatuses", cooperationStatuses);
		
		List<OpeningHours> openingHourses = companyService.findAllOpeningHourses();
		model.addAttribute("openingHourses", openingHourses);
		
		return "company/getAllCompanyPage";
	}
	
	@PostMapping(value = { "/company/addCompany" })
	public String AddCompany(@ModelAttribute("company") Company company,
			Model model
			,@RequestParam("transferToByteArray") MultipartFile companyLogoFile
			) {
//		 Check if file is not empty
		if (!companyLogoFile.isEmpty()) {    
			try {
				// Get bytes of the uploaded file
				byte[] logoBytes = companyLogoFile.getBytes();
				company.setCompanyLogo(logoBytes);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// Save the company to database
		companyService.addCompany(company);
		return "company/getAllCompanyPage";
	}
	
	@GetMapping(value = { "/company/showAllCompanys" })
	public String showAllCompanys(@RequestParam(name = "page", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Company> page = companyService.findByPage(pageNumber);

		model.addAttribute("page", page);

		return "company/getAllCompanyPage";
	}
	
	@GetMapping("/company/showEditedCompany")
	public String showEditedCompany(@RequestParam("id") Integer id, Model model) {
		Company company = companyService.findCompanyById(id);

		model.addAttribute("company", company);

		return "company/getEditedCompanyPage";
	}
	
}
