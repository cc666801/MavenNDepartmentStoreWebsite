package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyCounterService;

@Controller
@RequestMapping("/companycounters")
public class CompanyCounterController {
	
	@Autowired
    private CompanyCounterService companyCounterService;
	
	// 查詢所有資料
    @GetMapping("/")
    public String getAllCompanyCounters(@RequestParam(name = "page", defaultValue = "1") Integer pageNumber, Model model) {
        Page<CompanyCounter> companyCounters = companyCounterService.findCompanyCountersByPage(pageNumber);
        model.addAttribute("companyCounters", companyCounters);
        return "companycounters/getAllCompanyCounterPage";
    }
	
	// 新增資料
    @GetMapping("/add")
    public String addCompanyCounter(Model model) {
        CompanyCounter companyCounter = new CompanyCounter();
        model.addAttribute("companyCounter", companyCounter);
        
        List<Company> companies = companyCounterService.findAllCompanies();
        model.addAttribute("companies", companies);
        
        List<Counter> counters = companyCounterService.findAllCounters();
        model.addAttribute("counters", counters);
        
        return "companycounters/companycounter-form";
    }

    @PostMapping("/save")
    public String saveCompanyCounter(@ModelAttribute("companyCounter") CompanyCounter companyCounter) {
    	if (companyCounter.getId().getOnCounterTime() == null) {
            companyCounter.getId().setOnCounterTime(new Date());
        }
    	companyCounterService.saveCompanyCounter(companyCounter);
        return "redirect:/companycounters/";
    }
	

}
