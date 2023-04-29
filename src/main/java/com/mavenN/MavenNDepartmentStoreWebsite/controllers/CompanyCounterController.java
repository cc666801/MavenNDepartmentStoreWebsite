package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Company;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CompanyCounterId;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.CooperationStatus;
import com.mavenN.MavenNDepartmentStoreWebsite.models.beans.companySystem.Counter;
import com.mavenN.MavenNDepartmentStoreWebsite.models.services.CompanyCounterService;

@Controller
@RequestMapping("/companycounters")
public class CompanyCounterController {
	
	@Autowired
    private CompanyCounterService companyCounterService;
	
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

	 
	
	// 查詢所有資料
    @GetMapping("/")
    public String getAllCompanyCounters(@RequestParam(name = "page", defaultValue = "1") Integer pageNumber, Model model) {
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
    	companyCounter.getCompanyCounterId().setOnCounterTimeIfNull();
    	CooperationStatus cooperationStatus = companyCounterService.findCooperationStatusByCooperationStatusName("在櫃中");
    	companyCounter.getCompany().setCooperationStatus(cooperationStatus);
        companyCounterService.saveCompanyCounter(companyCounter);
        return "redirect:/companycounters/";
    }
	
 // 找到 CompanyCounter 物件 by id
    @GetMapping("/findCompanyCounterById")
    public String findCompanyCounterById(@RequestParam("companyId") Integer companyId,
                                         @RequestParam("counterId") Integer counterId,
                                         @RequestParam(name = "onCounterTime") @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") Date onCounterTime,
                                         Model model
                                     ) throws ParseException {
    	
    	CompanyCounterId id = new CompanyCounterId(companyId, counterId, onCounterTime);
    	CompanyCounter companyCounter = companyCounterService.findById(id);
    	
    	model.addAttribute("companyCounter", companyCounter);
        return "companycounters/getEditedCompanyCounterPage";
    }
    
    
    @PutMapping("/updateCompanyCounter")
    public String updateCompanyCounter(@ModelAttribute("companyCounter") CompanyCounter companyCounter) {
    	DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
    	DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    	try {
    	    String inputString = companyCounter.getDateStringFromFrontend();
    	    LocalDateTime dateTime = LocalDateTime.parse(inputString, inputFormatter);
    	    String outputString = dateTime.format(outputFormatter);
    	    Date date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(outputString);
    	    CompanyCounterId id = new CompanyCounterId(companyCounter.getCompanyCounterId().getCompanyId(), companyCounter.getCompanyCounterId().getCounterId(), date);
    	    companyCounter.setCompanyCounterId(id);
    	    companyCounterService.updateCompanyCounter(companyCounter);
    	    
    	} catch (ParseException e) {
    	    e.printStackTrace();
    	}
    	
        return "redirect:/companycounters/";
    }
}
