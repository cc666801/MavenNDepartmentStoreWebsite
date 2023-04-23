package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@GetMapping(value = { "/company/addCompanyPage" })
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
		
		return "company/addCompanyPage";
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
		return "redirect:/company/showAllCompanys";
	}
	
	@GetMapping(value = { "/company/showAllCompanys" })
	public String showAllCompanys(@RequestParam(name = "page", defaultValue = "1") Integer pageNumber, Model model) {
		Page<Company> page = companyService.findByPage(pageNumber);

		model.addAttribute("page", page);

		return "company/getAllCompanyPage";
	}
	
	@GetMapping("/company/showEditedCompany/{id}")
	public String showEditedCompany(@PathVariable("id") Integer id, Model model) {
		Company company = companyService.findCompanyById(id);

		String base64CompanyLogo = Base64.getEncoder().encodeToString(company.getCompanyLogo());
		
		company.setBase64StringCompanyLogo(base64CompanyLogo);
		
		model.addAttribute("company", company);
		
		List<Address> addresses = companyService.findAllAddresses();
		model.addAttribute("addresses", addresses);
		
		List<IndustryCategory> industryCategories = companyService.findAllIndustryCategorys();
		model.addAttribute("industryCategories", industryCategories);
		
		List<CooperationStatus> cooperationStatuses = companyService.findAllCooperationStatuses();
		model.addAttribute("cooperationStatuses", cooperationStatuses);
		
		List<OpeningHours> openingHourses = companyService.findAllOpeningHourses();
		model.addAttribute("openingHourses", openingHourses);

		return "company/getEditedCompanyPage";
	}
	
	@PutMapping("/company/updateCompany")
	public String updateCompany(@ModelAttribute("company") Company company) {
//		 Check if file is not empty
		if (!company.getTransferToByteArray().isEmpty()) {    
			try {
				// Get bytes of the uploaded file
				byte[] logoBytes = company.getTransferToByteArray().getBytes();
				company.setCompanyLogo(logoBytes);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(company.getOpeningHours());
		
		companyService.updateCompanyById(
				company.getCompanyId(),
				company.getCompanyName(),
				company.getCompanyPhone(),
				company.getCompanyLogo(),
				company.getAddress(),
				company.getIndustryCategory(),
				company.getOpeningHours(),
				company.getCooperationStatus());
		return "redirect:/company/showAllCompanys";
	}
	
	@DeleteMapping("/company/deleteCompany/{id}")
	public String deleteCompany(@PathVariable Integer id) {
		companyService.deleteCompanyById(id);
		return "redirect:/company/showAllCompanys";
	}
}
