package com.mavenN.MavenNDepartmentStoreWebsite.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
	
//	@InitBinder
//    public void initBinder(WebDataBinder binder) {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        dateFormat.setLenient(false);
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
//    }

	
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
    	if (companyCounter.getId().getOnCounterTime() == null) {
            companyCounter.getId().setOnCounterTime(new Date());
        }
    	companyCounterService.saveCompanyCounter(companyCounter);
        return "redirect:/companycounters/";
    }
	
 // 找到 CompanyCounter 物件 by id
    @GetMapping("/findCompanyCounterById")
    public String findCompanyCounterById(@RequestParam("companyId") Integer companyId,
                                         @RequestParam("counterId") Integer counterId,
                                         @RequestParam(name = "onCounterTime") @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS") Date onCounterTime,
                                         Model model
                                     ) {
        CompanyCounterId id = new CompanyCounterId(companyId, counterId, onCounterTime);
        System.out.println(id);
        CompanyCounter companyCounter = companyCounterService.findById(id);
        model.addAttribute("companyCounter", companyCounter);
        return "getEditedCompanyCounterPage";
    }
}
